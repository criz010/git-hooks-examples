#!/bin/bash
# install.sh
# Installs Git hooks from this directory into your repository

set -e

echo "Git Hooks Installation Script"
echo "=============================="
echo ""

# Check if we're in a Git repository
if [ ! -d "../.git" ]; then
    echo "ERROR: Not in a Git repository!"
    echo "This script must be run from the basic-hooks directory of a Git repository."
    exit 1
fi

# Define hooks directory
HOOKS_DIR="../.git/hooks"
SOURCE_DIR="."

# Create hooks directory if it doesn't exist
mkdir -p "$HOOKS_DIR"

# List of hooks to install
hooks=("pre-commit" "commit-msg" "pre-push")

echo "Installing hooks..."
echo ""

# Install each hook
for hook in "${hooks[@]}"; do
    if [ -f "$SOURCE_DIR/$hook" ]; then
        # Backup existing hook if it exists
        if [ -f "$HOOKS_DIR/$hook" ]; then
            echo "Backing up existing $hook to $hook.backup"
            mv "$HOOKS_DIR/$hook" "$HOOKS_DIR/$hook.backup"
        fi
        
        # Copy the hook
        cp "$SOURCE_DIR/$hook" "$HOOKS_DIR/$hook"
        
        # Make it executable
        chmod +x "$HOOKS_DIR/$hook"
        
        echo "Installed: $hook"
    else
        echo "WARNING: $hook not found in source directory, skipping"
    fi
done

echo ""
echo "=============================="
echo "Installation complete!"
echo ""
echo "Installed hooks:"
for hook in "${hooks[@]}"; do
    if [ -f "$HOOKS_DIR/$hook" ]; then
        echo "  - $hook"
    fi
done

echo ""
echo "What's next?"
echo "  1. Try making a commit to test the hooks"
echo "  2. Use 'git commit --no-verify' to bypass hooks if needed"
echo "  3. Customize hooks by editing files in .git/hooks/"
echo ""
echo "To uninstall, simply delete the hooks:"
echo "  rm .git/hooks/pre-commit .git/hooks/commit-msg .git/hooks/pre-push"
echo ""
