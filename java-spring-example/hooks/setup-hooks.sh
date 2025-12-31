#!/bin/bash
# setup-hooks.sh
# Installs Git hooks for this Spring Boot project

set -e

echo "Git Hooks Setup for Spring Boot Project"
echo "========================================"
echo ""

# Check if we're in a Git repository
if [ ! -d ".git" ]; then
    echo "ERROR: Not in a Git repository!"
    echo "Please run this script from the repository root."
    exit 1
fi

# Check if hooks directory exists
if [ ! -d "hooks" ]; then
    echo "ERROR: hooks directory not found!"
    echo "Please ensure you're running this script from the repository root."
    exit 1
fi

# Define paths
HOOKS_DIR=".git/hooks"
SOURCE_DIR="hooks"

# Create .git/hooks directory if it doesn't exist
mkdir -p "$HOOKS_DIR"

# List of hooks to install
hooks=("pre-commit" "commit-msg" "pre-push")

echo "Installing Git hooks..."
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
        echo "WARNING: $hook not found in hooks/ directory, skipping"
    fi
done

echo ""
echo "========================================"
echo "Installation complete!"
echo ""
echo "Installed hooks:"
for hook in "${hooks[@]}"; do
    if [ -f "$HOOKS_DIR/$hook" ]; then
        echo "  - $hook"
    fi
done

echo ""
echo "What these hooks do:"
echo "  pre-commit  - Checks for System.out.println, runs Checkstyle, validates pom.xml"
echo "  commit-msg  - Validates commit message format (Conventional Commits)"
echo "  pre-push    - Prevents pushes to main/master, runs test suite"
echo ""
echo "Quick start:"
echo "  1. Make some changes to the code"
echo "  2. Try: git commit -m 'test: trying out hooks'"
echo "  3. See the hooks in action!"
echo ""
echo "To bypass hooks (use sparingly):"
echo "  git commit --no-verify"
echo "  git push --no-verify"
echo ""
