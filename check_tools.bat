@echo off
git --version > %~dp0git_version.txt 2>&1
gh --version > %~dp0gh_version.txt 2>&1
whoami > %~dp0whoami.txt 2>&1
dir /a .git > %~dp0git_dir.txt 2>&1
