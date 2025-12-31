# Pre-commit Framework Example

This example demonstrates using the Pre-commit framework for managing Git hooks in a language-agnostic way.

## What is Pre-commit Framework?

Pre-commit is a framework for managing multi-language pre-commit hooks. It uses a simple YAML configuration file to define hooks, and can leverage hooks from a large community repository.

## Prerequisites

- Python 3.7 or higher
- pip
- Git

For Java examples:
- Java 17 or higher
- Maven 3.6 or higher

## Setup

### Install Pre-commit

```bash
# Via pip
pip install pre-commit

# Via Homebrew (macOS)
brew install pre-commit

# Via conda
conda install -c conda-forge pre-commit
```

### Install Hooks

```bash
# Install pre-commit hooks
pre-commit install

# Install pre-push hooks
pre-commit install --hook-type pre-push

# Install commit-msg hooks
pre-commit install --hook-type commit-msg
```

## What's Included

### Configuration

The `.pre-commit-config.yaml` file defines:

**Standard hooks:**
- Trailing whitespace check
- End of file fixer
- YAML/XML/JSON validation
- Large file detection
- Private key detection

**Java-specific hooks:**
- Prevent System.out.println
- Prevent printStackTrace()
- Maven compile check
- Checkstyle enforcement
- Branch protection

**Pre-push hooks:**
- Maven test suite

## Testing the Hooks

### Automatic Testing

Hooks run automatically on `git commit` and `git push`.

### Manual Testing

```bash
# Run on all files
pre-commit run --all-files

# Run specific hook
pre-commit run checkstyle --all-files

# Run on specific files
pre-commit run --files src/main/java/MyClass.java
```

### Test Examples

```bash
# This should FAIL (System.out.println)
echo "System.out.println('test');" > Test.java
git add Test.java
git commit -m "test: adding debug"

# This should PASS
echo "// Clean code" > Test.java
git add Test.java
git commit -m "test: clean code"
```

## Configuration Details

### Hook Stages

Pre-commit supports different stages:
- `commit` - Runs on git commit (default)
- `push` - Runs on git push
- `commit-msg` - Runs on commit message
- `manual` - Only runs when explicitly called

### Custom Hooks

Add custom hooks in `.pre-commit-config.yaml`:

```yaml
- repo: local
  hooks:
    - id: my-custom-hook
      name: My Custom Check
      entry: bash -c 'echo "Running custom check"'
      language: system
      types: [java]
```

### File Filtering

Hooks can target specific file types:

```yaml
- id: my-hook
  types: [java]          # Only .java files
  types: [python]        # Only .py files
  files: ^src/           # Only files in src/
  exclude: ^tests/       # Exclude tests/
```

## Updating Hooks

```bash
# Update to latest versions
pre-commit autoupdate

# This updates the 'rev' fields in .pre-commit-config.yaml
```

## Advantages of Pre-commit Framework

- Language-agnostic
- Large repository of community hooks
- Easy configuration via YAML
- Automatic updates
- Fast (runs only on changed files)
- No need for Node.js or JavaScript

## Disadvantages

- Requires Python
- YAML configuration can be verbose
- Learning curve for custom hooks

## Common Commands

```bash
# Install hooks
pre-commit install

# Run on all files
pre-commit run --all-files

# Run specific hook
pre-commit run <hook-id>

# Update hook versions
pre-commit autoupdate

# Uninstall
pre-commit uninstall
```

## Bypassing Hooks

```bash
# Skip pre-commit hooks
git commit --no-verify

# Skip pre-push hooks
git push --no-verify

# Skip for a specific hook
SKIP=checkstyle git commit -m "message"
```

## Integration with CI/CD

```yaml
# .github/workflows/pre-commit.yml
name: Pre-commit

on: [push, pull_request]

jobs:
  pre-commit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
      - uses: pre-commit/action@v3.0.0
```

## Troubleshooting

### Hooks not running

```bash
# Reinstall hooks
pre-commit uninstall
pre-commit install
```

### Python version issues

```bash
# Check Python version (needs 3.7+)
python --version

# Use specific Python version
python3 -m pre_commit install
```

### Slow hooks

```bash
# Run only on staged files (default)
pre-commit run

# Skip slow hooks temporarily
SKIP=maven-test git commit -m "message"
```

## Resources

- [Pre-commit Documentation](https://pre-commit.com/)
- [Pre-commit Hooks Repository](https://github.com/pre-commit/pre-commit-hooks)
- [Supported Hooks](https://pre-commit.com/hooks.html)
