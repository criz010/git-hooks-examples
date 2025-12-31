# Basic Git Hooks Examples

This directory contains simple, standalone Git hook examples that demonstrate the fundamentals of Git hooks.

## What's Included

- `pre-commit` - Runs before a commit is created
- `commit-msg` - Validates commit message format
- `pre-push` - Runs before pushing to remote
- `install.sh` - Script to install these hooks in your repository

## Installation

### Method 1: Automatic Installation (Recommended)

```bash
cd basic-hooks
./install.sh
```

This script will:
1. Copy all hooks to your `.git/hooks` directory
2. Make them executable
3. Create backups of any existing hooks

### Method 2: Manual Installation

```bash
# Copy hooks to .git/hooks
cp pre-commit ../.git/hooks/pre-commit
cp commit-msg ../.git/hooks/commit-msg
cp pre-push ../.git/hooks/pre-push

# Make them executable
chmod +x ../.git/hooks/pre-commit
chmod +x ../.git/hooks/commit-msg
chmod +x ../.git/hooks/pre-push
```

## Testing the Hooks

### Test Pre-commit Hook

This hook checks for common issues in your code.

```bash
# Create a test file with a debug statement
echo "System.out.println('debug');" > TestFile.java
git add TestFile.java
git commit -m "test commit"

# The hook should block this commit!
```

### Test Commit-msg Hook

This hook validates that your commit message follows Conventional Commits format.

```bash
# This should FAIL (invalid format)
git commit -m "fixed a bug"

# This should PASS (valid format)
git commit -m "fix: resolve null pointer exception"
```

Valid commit types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

### Test Pre-push Hook

This hook runs before you push to a remote repository.

```bash
# Try to push to main branch (should be blocked)
git checkout main
git push

# Try to push with failing tests
# The hook will run tests before allowing the push
```

## Customizing the Hooks

All hooks are simple bash scripts. Feel free to modify them to suit your needs!

### Example: Make Pre-commit Less Strict

Edit the `pre-commit` file and change exit codes:

```bash
# Change this:
exit 1  # Blocks the commit

# To this:
exit 0  # Only shows a warning
```

### Example: Add Your Own Checks

Add custom checks to any hook:

```bash
# Check for TODO comments
if git diff --cached | grep -i "TODO" > /dev/null; then
    echo "Warning: Found TODO in changes"
fi
```

## Bypassing Hooks

Sometimes you need to bypass hooks (emergency commits, work in progress):

```bash
# Bypass pre-commit and commit-msg hooks
git commit --no-verify -m "fix: emergency hotfix"

# Bypass pre-push hook
git push --no-verify
```

**Use sparingly!** Hooks exist for a reason.

## Understanding Each Hook

### pre-commit

Runs **before** you write a commit message. Perfect for:
- Checking code style
- Running linters
- Detecting debug statements
- Validating file sizes

### commit-msg

Runs **after** you write a commit message. Perfect for:
- Enforcing commit message format
- Validating message length
- Checking for required patterns (e.g., issue numbers)

### pre-push

Runs **before** pushing to remote. Perfect for:
- Running tests
- Checking build status
- Preventing pushes to protected branches

## Next Steps

After trying these basic hooks, check out:
- `java-spring-example/` - See hooks in a real Spring Boot project
- `husky-example/` - Modern hook management with Husky
- `pre-commit-framework-example/` - Language-agnostic hook framework

## Troubleshooting

### Hooks not executing?

```bash
# Check if hooks are executable
ls -la ../.git/hooks/

# Make them executable if needed
chmod +x ../.git/hooks/*
```

### Want to remove hooks?

```bash
# Remove specific hook
rm ../.git/hooks/pre-commit

# Or rename to disable
mv ../.git/hooks/pre-commit ../.git/hooks/pre-commit.disabled
```
