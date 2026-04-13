#!/bin/bash
# Package terminal-bg for GitHub Release
# This script creates a distributable package of the built executable

set -e

VERSION="v1.0.0"
PACKAGE_NAME="terminal-bg-${VERSION}-windows-x64"

echo "=== Packaging terminal-bg for GitHub Release ==="
echo ""

# Build the project
echo "Building project..."
zig build

# Create package directory
echo "Creating package directory: ${PACKAGE_NAME}"
mkdir -p "${PACKAGE_NAME}"

# Copy executable and documentation
echo "Copying files..."
cp zig-out/bin/terminal-bg.exe "${PACKAGE_NAME}/"
cp CLAUDE.md "${PACKAGE_NAME}/README.md"

# Create usage instructions
cat > "${PACKAGE_NAME}/USAGE.txt" << 'EOF'
Terminal Background Color Tool
==============================

A cross-platform CLI tool for getting and setting terminal background colors.

USAGE:
    terminal-bg.exe <command> [options]

COMMANDS:
    list                List all available colors
    get                 Get current background color (shows warning)
    set <color>         Set background color and clear screen

COLORS:
    Standard: black, red, green, yellow, blue, magenta, cyan, white
    Bright:   bright-black, bright-red, bright-green, bright-yellow,
              bright-blue, bright-magenta, bright-cyan, bright-white
    Special:  default (reset to terminal default)

EXAMPLES:
    terminal-bg.exe list
    terminal-bg.exe set blue
    terminal-bg.exe set bright-cyan
    terminal-bg.exe set default

REQUIREMENTS:
    - Windows 10+ with modern terminal (Windows Terminal, PowerShell, CMD)
    - ANSI escape sequence support

For more information, see README.md
EOF

# Create archive
echo "Creating archive: ${PACKAGE_NAME}.zip"
powershell.exe -Command "Compress-Archive -Path '${PACKAGE_NAME}' -DestinationPath '${PACKAGE_NAME}.zip' -Force"

# Cleanup
echo "Cleaning up temporary files..."
rm -rf "${PACKAGE_NAME}"

echo ""
echo "=== Package created successfully! ==="
echo "Package file: ${PACKAGE_NAME}.zip"
echo ""
echo "Next steps for GitHub Release:"
echo "1. Create a GitHub repository (if not exists)"
echo "2. Push your code: git push -u origin master"
echo "3. Create a release on GitHub:"
echo "   - Go to your repository → Releases → 'Draft a new release'"
echo "   - Tag: ${VERSION}"
echo "   - Title: Terminal Background Color Tool ${VERSION}"
echo "   - Upload: ${PACKAGE_NAME}.zip"
echo ""
echo "Package contents:"
echo "  - terminal-bg.exe (executable)"
echo "  - README.md (documentation)"
echo "  - USAGE.txt (quick start guide)"