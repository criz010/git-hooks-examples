# Git Hooks Examples Repository

This repository contains practical examples of Git hooks, accompanying the technical guide "About Git Hooks".

## What's Inside

This repository is organized into several directories, each demonstrating different aspects of Git hooks:

- **`basic-hooks/`** - Simple, standalone Git hook examples
- **`java-spring-example/`** - A complete Spring Boot project with Git hooks
- **`husky-example/`** - Examples using Husky hook manager
- **`pre-commit-framework-example/`** - Examples using Pre-commit framework

## Quick Start

### Prerequisites

Depending on which examples you want to try:

- **Git** (obviously!)
- **Java 17+** and **Maven** for Java examples
- **Node.js** and **npm** for Husky examples
- **Python 3.7+** for Pre-commit framework examples

### Getting Started

1. **Clone this repository:**

```bash
git clone https://github.com/criz010/git-hooks-examples.git
cd git-hooks-examples
```

2. **Choose an example directory** and follow its README

3. **Experiment!** Try making commits, pushing, and see the hooks in action

## Directory Overview

### Basic Hooks (`basic-hooks/`)

Simple, standalone Git hook scripts you can copy directly to your `.git/hooks` directory.

**What you'll find:**
- Pre-commit hook for code quality checks
- Commit-msg hook for message validation
- Pre-push hook for running tests
- Installation script

**Quick try:**
```bash
cd basic-hooks
./install.sh
# Make some commits and see the hooks in action!
```

### Java Spring Boot Example (`java-spring-example/`)

A minimal Spring Boot application with professional Git hooks setup.

**What you'll find:**
- Working Spring Boot project
- Custom hooks for Java/Maven projects
- Checkstyle integration
- Setup script for hook installation

**Quick try:**
```bash
cd java-spring-example
./hooks/setup-hooks.sh
# Try making a commit with System.out.println() and see it get blocked!
```

### Husky Example (`husky-example/`)

Modern hook management using Husky - great for projects already using npm.

**What you'll find:**
- Husky configuration
- Integration with Maven/Java
- Package.json setup

**Quick try:**
```bash
cd husky-example
npm install
# Hooks are automatically installed!
```

### Pre-commit Framework Example (`pre-commit-framework-example/`)

Language-agnostic hook management using the Pre-commit framework.

**What you'll find:**
- `.pre-commit-config.yaml` with Java-specific hooks
- Examples of using community hooks
- Custom local hooks

**Quick try:**
```bash
cd pre-commit-framework-example
pip install pre-commit
pre-commit install
# Try the hooks!
```

## Learning Path

If you're new to Git hooks, we recommend this learning path:

1. **Start with `basic-hooks/`** - Understand how Git hooks work fundamentally
2. **Try `java-spring-example/`** - See hooks in a real project context
3. **Explore `husky-example/` OR `pre-commit-framework-example/`** - Learn modern tooling

## Tips

- Each directory has its own detailed README with step-by-step instructions
- Don't be afraid to modify the hooks to suit your needs
- Use `git commit --no-verify` to bypass hooks in emergencies (but use sparingly!)
- Hooks should be fast - if a hook is too slow, optimize it

## Troubleshooting

### Hooks not executing?

1. Make sure hooks are executable: `chmod +x .git/hooks/pre-commit`
2. Check the shebang line: `#!/bin/bash` or `#!/usr/bin/env python`
3. Verify your Git version: `git --version` (hooks have been in Git since early versions)

### Permission denied errors?

Run: `chmod +x <hook-file>`

### Hooks work locally but not for teammates?

Remember: hooks in `.git/hooks` are not committed. Use one of these solutions:
- The setup script approach (see `java-spring-example/`)
- Husky (see `husky-example/`)
- Pre-commit framework (see `pre-commit-framework-example/`)

## Additional Resources

- [Official Git Hooks Documentation](https://git-scm.com/docs/githooks)
- [Husky Documentation](https://typicode.github.io/husky/)
- [Pre-commit Framework](https://pre-commit.com/)
- [Conventional Commits](https://www.conventionalcommits.org/)

## Contributing

Found a bug? Have a better example? Feel free to open an issue or submit a pull request!

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

These examples were created to accompany the technical guide "About Git Hooks". Happy hooking!
