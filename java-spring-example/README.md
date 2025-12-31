# Java Spring Boot Git Hooks Example

A minimal Spring Boot application demonstrating professional Git hooks setup for Java projects.

## Overview

This project shows how to integrate Git hooks into a Spring Boot application to:
- Enforce code quality standards
- Validate commit messages
- Run tests before pushing
- Prevent common mistakes

## Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- Git

## Quick Start

### 1. Clone and Build

```bash
git clone <repository-url>
cd java-spring-example

# Build the project
mvn clean install
```

### 2. Install Git Hooks

```bash
# Run the setup script
./hooks/setup-hooks.sh

# Or manually with chmod first
chmod +x hooks/setup-hooks.sh
./hooks/setup-hooks.sh
```

### 3. Try It Out

```bash
# This should FAIL (invalid commit message)
git commit -m "added new feature"

# This should PASS
git commit -m "feat: add new feature"
```

## What's Included

### Application Structure

```
java-spring-example/
├── src/
│   ├── main/java/com/example/demo/
│   │   ├── DemoApplication.java       # Main application
│   │   └── HelloController.java       # Sample REST controller
│   └── test/java/com/example/demo/
│       └── HelloControllerTest.java   # Sample tests
├── hooks/
│   ├── pre-commit                     # Code quality checks
│   ├── commit-msg                     # Message validation
│   ├── pre-push                       # Test execution
│   └── setup-hooks.sh                 # Installation script
├── pom.xml                            # Maven configuration
└── README.md                          # This file
```

### Git Hooks

#### pre-commit

Runs before creating a commit. Checks for:
- System.out.println usage (should use logging)
- printStackTrace() calls
- Sensitive data in properties files
- Code style violations (Checkstyle)
- Maven POM validity
- Compilation errors

#### commit-msg

Validates commit message format according to Conventional Commits:

Valid format: `<type>(<scope>): <subject>`

Types:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `style` - Formatting
- `refactor` - Code refactoring
- `test` - Tests
- `chore` - Maintenance

Examples:
```bash
feat(api): add user authentication endpoint
fix(database): resolve connection pool leak
docs: update README with installation steps
```

#### pre-push

Runs before pushing to remote. Performs:
- Branch protection (prevents direct pushes to main/master)
- Full test suite execution
- Build verification

## Running the Application

```bash
# Start the application
mvn spring-boot:run

# Test the endpoints
curl http://localhost:8080/api/hello
curl http://localhost:8080/api/status
```

## Testing the Hooks

### Test 1: Block System.out.println

```bash
# Add a System.out.println to a Java file
echo 'System.out.println("debug");' >> src/main/java/com/example/demo/HelloController.java

# Try to commit (should be blocked)
git add .
git commit -m "test: adding debug statement"

# Result: Hook blocks the commit
```

### Test 2: Invalid Commit Message

```bash
# Try an invalid commit message
git commit -m "fixed bug"

# Result: Hook blocks the commit

# Try a valid message
git commit -m "fix: resolve null pointer exception"

# Result: Commit succeeds
```

### Test 3: Protected Branch

```bash
# Switch to main branch
git checkout main

# Try to push
git push

# Result: Hook blocks the push
```

### Test 4: Failing Tests

```bash
# Modify a test to fail
# Then try to push from a feature branch
git checkout -b feature/test-hooks
git push origin feature/test-hooks

# Result: Hook runs tests, blocks if they fail
```

## Bypassing Hooks

Sometimes you need to bypass hooks (emergencies only!):

```bash
# Bypass pre-commit and commit-msg
git commit --no-verify -m "emergency: hotfix"

# Bypass pre-push
git push --no-verify
```

**Warning:** Only bypass hooks when absolutely necessary!

## Customizing Hooks

All hooks are simple bash scripts in the `hooks/` directory. Feel free to modify them:

### Example: Add Custom Check

Edit `hooks/pre-commit`:

```bash
# Add at the end, before the success message
if git diff --cached | grep -i "FIXME" > /dev/null; then
    echo "WARNING: Found FIXME in changes"
    # exit 1  # Uncomment to block
fi
```

### Example: Disable Checkstyle

Edit `hooks/pre-commit` and comment out:

```bash
# mvn -q checkstyle:check
```

## Code Quality Tools

### Checkstyle

This project uses Google's Java Style Guide. To check your code:

```bash
# Check style
mvn checkstyle:check

# Generate report
mvn checkstyle:checkstyle
# Report: target/site/checkstyle.html
```

### Running Tests

```bash
# Run all tests
mvn test

# Run specific test
mvn test -Dtest=HelloControllerTest

# Run with coverage
mvn test jacoco:report
```

## Troubleshooting

### Hooks not executing

```bash
# Check if hooks are executable
ls -la .git/hooks/

# Make them executable if needed
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/commit-msg
chmod +x .git/hooks/pre-push
```

### Maven not found

```bash
# Check Maven installation
mvn -version

# Install Maven (Ubuntu/Debian)
sudo apt-get install maven

# Install Maven (macOS)
brew install maven
```

### Java version issues

```bash
# Check Java version (needs 17+)
java -version

# Set JAVA_HOME if needed
export JAVA_HOME=/path/to/java17
```

## Team Workflow

### For New Team Members

1. Clone the repository
2. Run `./hooks/setup-hooks.sh`
3. Start developing!

### Updating Hooks

When hooks are updated:

1. Pull the latest changes
2. Re-run `./hooks/setup-hooks.sh`
3. Old hooks are automatically backed up

### Git Configuration

You can also configure Git to use the hooks directory directly:

```bash
# Use hooks from the repository
git config core.hooksPath hooks

# Now hooks run automatically without copying
```

## Best Practices

1. **Commit frequently** - Hooks run quickly on small changes
2. **Write good commit messages** - Conventional Commits are enforced
3. **Run tests locally** - Don't rely only on pre-push hook
4. **Don't bypass hooks** - They're there for a reason
5. **Update hooks** - Re-run setup script when hooks change

## Additional Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
- [Git Hooks Documentation](https://git-scm.com/docs/githooks)

## License

MIT License - See LICENSE file for details
// Test comment
