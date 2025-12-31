# Husky Example

This example demonstrates using Husky to manage Git hooks in a project.

## What is Husky?

Husky is a popular npm package that makes Git hooks easy to use and share with your team. Hooks are stored in the `.husky` directory and are committed to your repository.

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn

## Setup

```bash
# Install dependencies
npm install

# Hooks are automatically installed via the "prepare" script
```

## What's Included

### Hooks

- **pre-commit**: Checks for console.log and debugger statements
- **commit-msg**: Validates commit message format (Conventional Commits)

### Configuration Files

- `package.json`: Contains Husky configuration and scripts
- `.husky/`: Directory containing hook scripts

## Testing the Hooks

### Test Pre-commit

```bash
# Create a file with console.log
echo "console.log('test');" > test.js
git add test.js
git commit -m "test: adding debug"

# Hook should block this commit
```

### Test Commit-msg

```bash
# Invalid message (should fail)
git commit -m "added feature"

# Valid message (should pass)
git commit -m "feat: add new feature"
```

## Adding New Hooks

```bash
# Create a new hook
npx husky add .husky/pre-push "npm test"

# Make it executable
chmod +x .husky/pre-push
```

## Integration with Maven/Java

You can use Husky even in Java projects:

```bash
# Add to .husky/pre-commit
mvn checkstyle:check || exit 1

# Add to .husky/pre-push
mvn test || exit 1
```

## Advantages of Husky

- Hooks are version controlled
- Automatic installation with npm install
- Cross-platform support
- Easy to configure
- Large community

## Disadvantages

- Requires Node.js/npm
- One more dependency
- May be overkill for simple projects

## Bypassing Hooks

```bash
git commit --no-verify -m "emergency fix"
```

## Resources

- [Husky Documentation](https://typicode.github.io/husky/)
- [Conventional Commits](https://www.conventionalcommits.org/)
