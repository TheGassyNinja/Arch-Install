#!/bin/bash
# This script is a wrapper for lazygit
# List All git repos on your machine
# offer a choice to open one in lazygit
# or create a new one in current dir
# or clone a repo from github
# or delete a repo

# Dependencies: lazygit, fzf, git, xclip

# Function to list all git repos on the machine

list_repos() {
    find ~/Projects -type d -name ".git" 2>/dev/null | sed 's/\/.git//'
}

# Function to open a git repo in lazygit
open_repo() {
    local repo_path="$1"
    lazygit -p "$repo_path"
}

# Function to choose a git repo using fzf and open it in lazygit
choose_and_open_repo() {
    local repo_path
    repo_path=$(list_repos | fzf)
    if [[ -n "$repo_path" ]]; then
        open_repo "$repo_path"
    fi
}

# Prompt the user for action
echo "Lazy Git - Choose an action:"
echo "1. List all git repos"
echo "2. Open a git repo in lazygit"
echo "3. Create a new git repo in the current directory"
echo "4. Clone a git repo from GitHub"
echo "5. Delete a git repo"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        list_repos
        ;;
    2)
        choose_and_open_repo
        ;;
    3)
        create_repo
        ;;
    4)
        read -p "Enter the URL of the git repo: " repo_url
        clone_repo "$repo_url"
        ;;
    5)
        read -p "Enter the path of the git repo: " repo_path
        delete_repo "$repo_path"
        ;;
    *)
        echo "Invalid choice"
        delete_repo "$repo_path"
esac