# Terminal Background Color Tool / 终端背景色工具

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Zig](https://img.shields.io/badge/Zig-0.16-orange.svg)](https://ziglang.org)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](https://github.com)

A cross-platform CLI tool for getting and setting terminal background colors. Works on modern terminals that support ANSI escape sequences.

一个跨平台的 CLI 工具，用于获取和设置终端背景颜色。适用于支持 ANSI 转义序列的现代终端。

---

## Features / 功能特性

### English
- 🎨 **17 color options**: 8 standard colors + 8 bright variants + default
- 🖥️ **Cross-platform**: Works on Windows 10+, Linux, macOS
- ⚡ **Fast and lightweight**: Single executable, no dependencies
- 🔄 **ANSI escape sequences**: Modern terminal support
- 📦 **Easy distribution**: Pre-built binaries available on GitHub Releases

### 中文
- 🎨 **17 种颜色**: 8 种标准色 + 8 种亮色 + 默认色
- 🖥️ **跨平台**: 支持 Windows 10+、Linux、macOS
- ⚡ **快速轻量**: 单个可执行文件，无依赖
- 🔄 **ANSI 转义序列**: 现代终端支持
- 📦 **易于分发**: GitHub Releases 提供预编译二进制文件

---

## Installation / 安装

### Download Pre-built Binary / 下载预编译版本

**English:**
1. Go to [GitHub Releases](https://github.com/zhangj1164/terminal-color/releases)
2. Download the latest `terminal-bg-vX.X.X-windows-x64.zip`
3. Extract the ZIP file
4. Run `terminal-bg.exe` from the extracted folder

**中文:**
1. 访问 [GitHub Releases](https://github.com/zhangj1164/terminal-color/releases)
2. 下载最新的 `terminal-bg-vX.X.X-windows-x64.zip`
3. 解压 ZIP 文件
4. 从解压后的文件夹运行 `terminal-bg.exe`

### Build from Source / 从源码构建

**English:**
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

**中文:**
环境要求：
- 系统已安装 [Zig 0.16+](https://ziglang.org/download/)

```bash
# 克隆仓库
git clone https://github.com/zhangj1164/terminal-color.git
cd terminal-color

# 构建项目
zig build

# 可执行文件位于 zig-out/bin/terminal-bg.exe
```

---

## Usage / 使用方法

### Basic Commands / 基本命令

**English:**
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

**中文:**
```bash
# 列出所有可用颜色
terminal-bg list

# 设置背景颜色
terminal-bg set blue
terminal-bg set bright-cyan

# 获取当前背景颜色（会显示警告）
terminal-bg get

# 重置为默认
terminal-bg set default
```

### Using zig build / 使用 zig build

**English:**
During development, you can use `zig build run` to execute commands:

```bash
zig build run -- list
zig build run -- set blue
zig build run -- get
```

**中文:**
开发过程中，可以使用 `zig build run` 执行命令：

```bash
zig build run -- list
zig build run -- set blue
zig build run -- get
```

---

## Available Colors / 可用颜色

### Standard Colors (8) / 标准颜色 (8 种)

| Color | ANSI Code | Example |
|-------|-----------|---------|
| black | `\x1b[40m` | Dark background |
| red | `\x1b[41m` | Red background |
| green | `\x1b[42m` | Green background |
| yellow | `\x1b[43m` | Yellow background |
| blue | `\x1b[44m` | Blue background |
| magenta | `\x1b[45m` | Purple background |
| cyan | `\x1b[46m` | Cyan background |
| white | `\x1b[47m` | White background |

| 颜色 | ANSI 代码 | 示例 |
|------|-----------|------|
| black (黑色) | `\x1b[40m` | 深色背景 |
| red (红色) | `\x1b[41m` | 红色背景 |
| green (绿色) | `\x1b[42m` | 绿色背景 |
| yellow (黄色) | `\x1b[43m` | 黄色背景 |
| blue (蓝色) | `\x1b[44m` | 蓝色背景 |
| magenta (紫红色) | `\x1b[45m` | 紫色背景 |
| cyan (青色) | `\x1b[46m` | 青色背景 |
| white (白色) | `\x1b[47m` | 白色背景 |

### Bright Colors (8) / 亮色 (8 种)

| Color | ANSI Code | Description |
|-------|-----------|-------------|
| bright-black | `\x1b[100m` | Gray background |
| bright-red | `\x1b[101m` | Bright red |
| bright-green | `\x1b[102m` | Bright green |
| bright-yellow | `\x1b[103m` | Bright yellow |
| bright-blue | `\x1b[104m` | Bright blue |
| bright-magenta | `\x1b[105m` | Bright purple |
| bright-cyan | `\x1b[106m` | Bright cyan |
| bright-white | `\x1b[107m` | Bright white |

| 颜色 | ANSI 代码 | 描述 |
|------|-----------|------|
| bright-black (亮黑色/灰色) | `\x1b[100m` | 灰色背景 |
| bright-red (亮红色) | `\x1b[101m` | 亮红色 |
| bright-green (亮绿色) | `\x1b[102m` | 亮绿色 |
| bright-yellow (亮黄色) | `\x1b[103m` | 亮黄色 |
| bright-blue (亮蓝色) | `\x1b[104m` | 亮蓝色 |
| bright-magenta (亮紫红色) | `\x1b[105m` | 亮紫色 |
| bright-cyan (亮青色) | `\x1b[106m` | 亮青色 |
| bright-white (亮白色) | `\x1b[107m` | 亮白色 |

### Special Color / 特殊颜色

- `default` - Reset to terminal's default background color
- `default` - 重置为终端的默认背景颜色

---

## Use Cases / 使用场景

**English:**
- 💻 **Personalize terminal appearance**: Customize your workspace
- 🔄 **Distinguish terminal windows**: Use different colors for PowerShell, CMD, Git Bash
- 👁️ **Improve readability**: Reduce eye strain with softer background colors
- 🎨 **Coding environment**: Create a comfortable development environment
- 📊 **Status indication**: Visual cues for different tasks or environments

**中文:**
- 💻 **个性化终端外观**: 定制您的工作空间
- 🔄 **区分终端窗口**: 为 PowerShell、CMD、Git Bash 使用不同颜色
- 👁️ **提高可读性**: 使用较柔和的背景颜色减少眼睛疲劳
- 🎨 **编程环境**: 创建舒适的开发环境
- 📊 **状态指示**: 为不同任务或环境提供视觉提示

---

## Technical Details / 技术细节

### Architecture / 架构

**English:**
- **Single-file structure**: All application logic in `terminal-bg.zig`
- **Platform abstraction**: Separate `WindowsTerminal` and `UnixTerminal` implementations
- **ANSI escape sequences**: Unified approach for all platforms
- **Color handling**: `Color` enum with `toAnsiBg()` and `fromString()` methods
- **Compile-time optimization**: Uses `std.StaticStringMap` for efficient color parsing

**中文:**
- **单文件结构**: 所有应用逻辑在 `terminal-bg.zig` 中
- **平台抽象**: 分离的 `WindowsTerminal` 和 `UnixTerminal` 实现
- **ANSI 转义序列**: 所有平台的统一方案
- **颜色处理**: `Color` 枚举包含 `toAnsiBg()` 和 `fromString()` 方法
- **编译时优化**: 使用 `std.StaticStringMap` 进行高效颜色解析

### Zig 0.16 Compatibility / Zig 0.16 兼容性

**English:**
This project uses Zig 0.16 APIs:
- `root_module` API in `build.zig`
- `std.process.Init.Minimal` for main function signature
- `std.process.Args.Iterator` for argument iteration
- `std.debug.print()` for simplified I/O

**中文:**
本项目使用 Zig 0.16 API：
- `build.zig` 中使用 `root_module` API
- 主函数使用 `std.process.Init.Minimal` 参数
- 参数迭代使用 `std.process.Args.Iterator`
- 使用 `std.debug.print()` 简化 I/O

### Limitations / 限制

**English:**
- ⚠️ **Background color detection**: The `get` command cannot reliably detect current background color on any platform (ANSI limitation)
- 💻 **Terminal compatibility**: Requires modern terminal with ANSI support (Windows 10+, most Linux/macOS terminals)
- 🖥️ **Screen clearing**: Setting color clears the screen to apply the new background

**中文:**
- ⚠️ **背景色检测**: `get` 命令无法在任何平台上可靠检测当前背景颜色（ANSI 限制）
- 💻 **终端兼容性**: 需要支持 ANSI 的现代终端（Windows 10+, 大多数 Linux/macOS 终端）
- 🖥️ **清屏**: 设置颜色时会清屏以应用新背景

---

## Project Structure / 项目结构

```
terminal-color/
├── terminal-bg.zig          # Main source code / 主源代码
├── build.zig                 # Build configuration / 构建配置
├── CLAUDE.md                 # Claude Code guidance / Claude Code 指导文档
├── README.md                 # This file / 本文件
├── RELEASE_SETUP.md          # Release setup guide / Release 设置指南
├── package-release.sh        # Packaging script / 打包脚本
├── terminal-bg-quick.bat     # Quick usage batch file / 快速使用批处理
├── .gitignore                # Git ignore rules / Git 忽略规则
└── .github/
    └── workflows/
        └── release.yml       # GitHub Actions workflow / GitHub Actions 工作流
```

---

## Development / 开发

### Build Commands / 构建命令

**English:**
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

**中文:**
```bash
# 构建可执行文件
zig build

# 带参数运行
zig build run -- list
zig build run -- set blue
zig build run -- get

# 安装到 zig-out/bin
zig build install
```

### Creating a Release / 创建 Release

**English:**
See [RELEASE_SETUP.md](RELEASE_SETUP.md) for detailed instructions on creating GitHub releases.

```bash
# Create and push a version tag
git tag v1.0.0
git push origin v1.0.0

# GitHub Actions will automatically build and publish
```

**中文:**
详细说明请参见 [RELEASE_SETUP.md](RELEASE_SETUP.md)。

```bash
# 创建并推送版本标签
git tag v1.0.0
git push origin v1.0.0

# GitHub Actions 会自动构建并发布
```

---

## Contributing / 贡献

**English:**
Contributions are welcome! Feel free to:
- 🐛 Report bugs
- 💡 Suggest new features
- 🔧 Submit pull requests
- 📖 Improve documentation

**中文:**
欢迎贡献！您可以：
- 🐛 报告错误
- 💡 建议新功能
- 🔧 提交拉取请求
- 📖 改进文档

---

## License / 许可证

MIT License - see [LICENSE](LICENSE) file for details.

MIT 许可证 - 详情见 [LICENSE](LICENSE) 文件。

---

## Acknowledgments / 致谢

**English:**
- Built with [Zig](https://ziglang.org/) programming language
- Inspired by the need for simple terminal customization tools
- Thanks to the Zig community for documentation and support

**中文:**
- 使用 [Zig](https://ziglang.org/) 编程语言构建
- 源于对简单终端定制工具的需求
- 感谢 Zig 社区的文档和支持

---

## Support / 支持

**English:**
- 📖 [Documentation](CLAUDE.md)
- 🐛 [Issue Tracker](https://github.com/zhangj1164/terminal-color/issues)
- 💬 [Discussions](https://github.com/zhangj1164/terminal-color/discussions)

**中文:**
- 📖 [文档](CLAUDE.md)
- 🐛 [问题追踪](https://github.com/zhangj1164/terminal-color/issues)
- 💬 [讨论](https://github.com/zhangj1164/terminal-color/discussions)

---

**Made with ❤️ using Zig**

**用 ❤️ 使用 Zig 制作**