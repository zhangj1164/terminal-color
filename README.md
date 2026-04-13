# Terminal Background Color Tool

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Zig](https://img.shields.io/badge/Zig-0.16-orange.svg)](https://ziglang.org)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](https://github.com)

**[中文文档](README_CN.md)** | **English**

A cross-platform CLI tool for getting and setting terminal background colors. Works on modern terminals that support ANSI escape sequences.

---

## Features

- 🎨 **17 color options**: 8 standard colors + 8 bright variants + default
- 🖥️ **Cross-platform**: Works on Windows 10+, Linux, macOS
- ⚡ **Fast and lightweight**: Single executable, no dependencies
- 🔄 **ANSI escape sequences**: Modern terminal support
- 📦 **Easy distribution**: Pre-built binaries available on GitHub Releases

---

## Installation

### Download Pre-built Binary

1. Go to [GitHub Releases](https://github.com/zhangj1164/terminal-color/releases)
2. Download the latest `terminal-bg-vX.X.X-windows-x64.zip`
3. Extract the ZIP file
4. Run `terminal-bg.exe` from the extracted folder

### Build from Source

Requirements:
- [Zig 0.16+](https://ziglang.org/download/) installed on your system

```bash
# Clone the repository
git clone https://github.com/zhangj1164/terminal-color.git
cd terminal-color

# Build the project
zig build

# The executable will be in zig-out/bin/terminal-bg.exe
```

---

## Usage

### Basic Commands

```bash
# List all available colors
terminal-bg list

# Set background color
terminal-bg set blue
terminal-bg set bright-cyan

# Get current background color (shows warning)
terminal-bg get

# Reset to default
terminal-bg set default
```

### Using zig build

During development, you can use `zig build run` to execute commands:

```bash
zig build run -- list
zig build run -- set blue
zig build run -- get
```

---

## Available Colors

### Standard Colors (8)

| Color | ANSI Code | Description |
|-------|-----------|-------------|
| black | `\x1b[40m` | Black background |
| red | `\x1b[41m` | Red background |
| green | `\x1b[42m` | Green background |
| yellow | `\x1b[43m` | Yellow background |
| blue | `\x1b[44m` | Blue background |
| magenta | `\x1b[45m` | Magenta background |
| cyan | `\x1b[46m` | Cyan background |
| white | `\x1b[47m` | White background |

### Bright Colors (8)

| Color | ANSI Code | Description |
|-------|-----------|-------------|
| bright-black | `\x1b[100m` | Gray background |
| bright-red | `\x1b[101m` | Bright red |
| bright-green | `\x1b[102m` | Bright green |
| bright-yellow | `\x1b[103m` | Bright yellow |
| bright-blue | `\x1b[104m` | Bright blue |
| bright-magenta | `\x1b[105m` | Bright magenta |
| bright-cyan | `\x1b[106m` | Bright cyan |
| bright-white | `\x1b[107m` | Bright white |

### Special Color

- `default` - Reset to terminal's default background color

---

## Use Cases

- 💻 **Personalize terminal appearance**: Customize your workspace
- 🔄 **Distinguish terminal windows**: Use different colors for PowerShell, CMD, Git Bash
- 👁️ **Improve readability**: Reduce eye strain with softer background colors
- 🎨 **Coding environment**: Create a comfortable development environment
- 📊 **Status indication**: Visual cues for different tasks or environments

---

## Technical Details

### Architecture

- **Single-file structure**: All application logic in `terminal-bg.zig`
- **Platform abstraction**: Separate `WindowsTerminal` and `UnixTerminal` implementations
- **ANSI escape sequences**: Unified approach for all platforms
- **Color handling**: `Color` enum with `toAnsiBg()` and `fromString()` methods
- **Compile-time optimization**: Uses `std.StaticStringMap` for efficient color parsing

### Zig 0.16 Compatibility

This project uses Zig 0.16 APIs:
- `root_module` API in `build.zig`
- `std.process.Init.Minimal` for main function signature
- `std.process.Args.Iterator` for argument iteration
- `std.debug.print()` for simplified I/O

### Limitations

- ⚠️ **Background color detection**: The `get` command cannot reliably detect current background color on any platform (ANSI limitation)
- 💻 **Terminal compatibility**: Requires modern terminal with ANSI support (Windows 10+, most Linux/macOS terminals)
- 🖥️ **Screen clearing**: Setting color clears the screen to apply the new background

---

## Project Structure

```
terminal-color/
├── terminal-bg.zig          # Main source code
├── build.zig                 # Build configuration
├── CLAUDE.md                 # Claude Code guidance
├── README.md                 # English documentation
├── README_CN.md              # Chinese documentation
├── RELEASE_SETUP.md          # Release setup guide
├── package-release.sh        # Packaging script
├── terminal-bg-quick.bat     # Quick usage batch file
├── .gitignore                # Git ignore rules
└── .github/
    └── workflows/
        └── release.yml       # GitHub Actions workflow
```

---

## Development

### Build Commands

```bash
# Build the executable
zig build

# Run with arguments
zig build run -- list
zig build run -- set blue
zig build run -- get

# Install to zig-out/bin
zig build install
```

### Creating a Release

See [RELEASE_SETUP.md](RELEASE_SETUP.md) for detailed instructions on creating GitHub releases.

```bash
# Create and push a version tag
git tag v1.0.0
git push origin v1.0.0

# GitHub Actions will automatically build and publish
```

---

## Contributing

Contributions are welcome! Feel free to:
- 🐛 Report bugs
- 💡 Suggest new features
- 🔧 Submit pull requests
- 📖 Improve documentation

---

## License

MIT License - see [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Built with [Zig](https://ziglang.org/) programming language
- Inspired by the need for simple terminal customization tools
- Thanks to the Zig community for documentation and support

---

## Support

- 📖 [Documentation](CLAUDE.md)
- 🐛 [Issue Tracker](https://github.com/zhangj1164/terminal-color/issues)
- 💬 [Discussions](https://github.com/zhangj1164/terminal-color/discussions)

---

**Made with ❤️ using Zig**