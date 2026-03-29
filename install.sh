#!/bin/bash
# install.sh — One-command recipe installer
# Usage: ./install.sh <recipe-name> <target-project-path>

set -euo pipefail

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

RECIPES_DIR="$(cd "$(dirname "$0")/recipes" && pwd)"

show_banner() {
    echo -e "${BLUE}"
    echo "╔═══════════════════════════════════════════════╗"
    echo "║   🚀 Claude Code Recipe Installer             ║"
    echo "║   Production-Ready Workflows in One Command   ║"
    echo "╚═══════════════════════════════════════════════╝"
    echo -e "${NC}"
}

list_recipes() {
    echo -e "${YELLOW}Available recipes:${NC}"
    echo ""
    for dir in "$RECIPES_DIR"/*/; do
        name=$(basename "$dir")
        short_name="${name#[0-9]*-}"
        desc=$(head -3 "$dir/README.md" 2>/dev/null | grep -oP '(?<=\*\*).+?(?=\*\*)' | head -1 || echo "No description")
        echo -e "  ${GREEN}${short_name}${NC}  →  ${desc}"
    done
    echo ""
    echo "Usage: $0 <recipe-name> <target-project-path>"
}

find_recipe() {
    local name="$1"
    for dir in "$RECIPES_DIR"/*/; do
        dir_name=$(basename "$dir")
        short_name="${dir_name#[0-9]*-}"
        if [[ "$short_name" == "$name" || "$dir_name" == "$name" ]]; then
            echo "$dir"
            return 0
        fi
    done
    return 1
}

install_recipe() {
    local recipe_dir="$1"
    local target="$2"
    local recipe_name=$(basename "$recipe_dir")

    echo -e "${BLUE}Installing recipe: ${recipe_name}${NC}"
    echo ""

    # Create target .claude directories if they don't exist
    mkdir -p "$target/.claude/commands" 2>/dev/null || true
    mkdir -p "$target/.claude/agents" 2>/dev/null || true

    # Copy CLAUDE.md (append if exists)
    if [[ -f "$recipe_dir/CLAUDE.md" ]]; then
        if [[ -f "$target/CLAUDE.md" ]]; then
            echo -e "${YELLOW}⚠ CLAUDE.md exists — appending recipe config${NC}"
            echo "" >> "$target/CLAUDE.md"
            echo "# --- Recipe: ${recipe_name} ---" >> "$target/CLAUDE.md"
            cat "$recipe_dir/CLAUDE.md" >> "$target/CLAUDE.md"
        else
            cp "$recipe_dir/CLAUDE.md" "$target/CLAUDE.md"
        fi
        echo -e "  ${GREEN}✓${NC} CLAUDE.md"
    fi

    # Copy slash commands
    if [[ -d "$recipe_dir/.claude/commands" ]]; then
        cp "$recipe_dir/.claude/commands/"*.md "$target/.claude/commands/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Slash commands"
    fi

    # Copy agents
    if [[ -d "$recipe_dir/agents" ]]; then
        cp "$recipe_dir/agents/"*.md "$target/.claude/agents/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Subagents"
    fi

    # Copy hooks
    if [[ -d "$recipe_dir/hooks" ]]; then
        mkdir -p "$target/.claude/hooks" 2>/dev/null || true
        cp "$recipe_dir/hooks/"* "$target/.claude/hooks/" 2>/dev/null || true
        chmod +x "$target/.claude/hooks/"*.sh 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Hooks"
    fi

    # Copy GitHub Actions
    if [[ -d "$recipe_dir/.github" ]]; then
        mkdir -p "$target/.github/workflows" 2>/dev/null || true
        cp "$recipe_dir/.github/workflows/"* "$target/.github/workflows/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} GitHub Actions"
    fi

    # Copy scripts
    if [[ -d "$recipe_dir/scripts" ]]; then
        mkdir -p "$target/scripts" 2>/dev/null || true
        cp "$recipe_dir/scripts/"* "$target/scripts/" 2>/dev/null || true
        chmod +x "$target/scripts/"*.sh 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Scripts"
    fi

    echo ""
    echo -e "${GREEN}✅ Recipe '${recipe_name}' installed to ${target}${NC}"
    echo ""

    # Run validation if available
    if [[ -f "$recipe_dir/validate.sh" ]]; then
        echo -e "${YELLOW}Running validation...${NC}"
        bash "$recipe_dir/validate.sh" "$target" && \
            echo -e "${GREEN}✅ Validation passed${NC}" || \
            echo -e "${RED}⚠ Validation found issues — check output above${NC}"
    fi
}

# --- Main ---
show_banner

if [[ $# -lt 1 ]]; then
    list_recipes
    exit 0
fi

RECIPE_NAME="$1"
TARGET="${2:-.}"

# Resolve target to absolute path
TARGET=$(cd "$TARGET" 2>/dev/null && pwd || echo "$TARGET")

if [[ ! -d "$TARGET" ]]; then
    echo -e "${RED}Error: Target directory '$TARGET' does not exist${NC}"
    exit 1
fi

RECIPE_DIR=$(find_recipe "$RECIPE_NAME") || {
    echo -e "${RED}Error: Recipe '$RECIPE_NAME' not found${NC}"
    echo ""
    list_recipes
    exit 1
}

install_recipe "$RECIPE_DIR" "$TARGET"
