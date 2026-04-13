# 终端背景色工具

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Zig](https://img.shields.io/badge/Zig-0.16-orange.svg)](https://ziglang.org)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](https://github.com)

**中文** | **[English Documentation](README.md)**

一个跨平台的 CLI 工具，用于获取和设置终端背景颜色。适用于支持 ANSI 转义序列的现代终端。

---

## 功能特性

- 🎨 **17 种颜色选项**: 8 种标准色 + 8 种亮色 + 默认色
- 🖥️ **跨平台**: 支持 Windows 10+、Linux、macOS
- ⚡ **快速轻量**: 单个可执行文件，无依赖
- 🔄 **ANSI 转义序列**: 现代终端支持
- 📦 **易于分发**: GitHub Releases 提供预编译二进制文件

---

## 安装

### 下载预编译版本

1. 访问 [GitHub Releases](https://github.com/zhangj1164/terminal-color/releases)
2. 下载最新的 `terminal-bg-vX.X.X-windows-x64.zip`
3. 解压 ZIP 文件
4. 从解压后的文件夹运行 `terminal-bg.exe`

### 从源码构建

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

## 使用方法

### 基本命令

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

### 使用 zig build

开发过程中，可以使用 `zig build run` 执行命令：

```bash
zig build run -- list
zig build run -- set blue
zig build run -- get
```

---

## 可用颜色

### 标准颜色 (8 种)

| 颜色 | ANSI 代码 | 说明 |
|------|-----------|------|
| black (黑色) | `\x1b[40m` | 黑色背景 |
| red (红色) | `\x1b[41m` | 红色背景 |
| green (绿色) | `\x1b[42m` | 绿色背景 |
| yellow (黄色) | `\x1b[43m` | 黄色背景 |
| blue (蓝色) | `\x1b[44m` | 蓝色背景 |
| magenta (紫红色) | `\x1b[45m` | 紫红色背景 |
| cyan (青色) | `\x1b[46m` | 青色背景 |
| white (白色) | `\x1b[47m` | 白色背景 |

### 亮色 (8 种)

| 颜色 | ANSI 代码 | 说明 |
|------|-----------|------|
| bright-black (亮黑色/灰色) | `\x1b[100m` | 灰色背景 |
| bright-red (亮红色) | `\x1b[101m` | 亮红色背景 |
| bright-green (亮绿色) | `\x1b[102m` | 亮绿色背景 |
| bright-yellow (亮黄色) | `\x1b[103m` | 亮黄色背景 |
| bright-blue (亮蓝色) | `\x1b[104m` | 亮蓝色背景 |
| bright-magenta (亮紫红色) | `\x1b[105m` | 亮紫红色背景 |
| bright-cyan (亮青色) | `\x1b[106m` | 亮青色背景 |
| bright-white (亮白色) | `\x1b[107m` | 亮白色背景 |

### 特殊颜色

- `default` - 重置为终端的默认背景颜色

---

## 使用场景

- 💻 **个性化终端外观**: 定制您的工作空间
- 🔄 **区分终端窗口**: 为 PowerShell、CMD、Git Bash 使用不同颜色
- 👁️ **提高可读性**: 使用较柔和的背景颜色减少眼睛疲劳
- 🎨 **编程环境**: 创建舒适的开发环境
- 📊 **状态指示**: 为不同任务或环境提供视觉提示

---

## 技术细节

### 架构

- **单文件结构**: 所有应用逻辑在 `terminal-bg.zig` 中
- **平台抽象**: 分离的 `WindowsTerminal` 和 `UnixTerminal` 实现
- **ANSI 转义序列**: 所有平台的统一方案
- **颜色处理**: `Color` 枚举包含 `toAnsiBg()` 和 `fromString()` 方法
- **编译时优化**: 使用 `std.StaticStringMap` 进行高效颜色解析

### Zig 0.16 兼容性

本项目使用 Zig 0.16 API：
- `build.zig` 中使用 `root_module` API
- 主函数使用 `std.process.Init.Minimal` 参数
- 参数迭代使用 `std.process.Args.Iterator`
- 使用 `std.debug.print()` 简化 I/O

### 限制

- ⚠️ **背景色检测**: `get` 命令无法在任何平台上可靠检测当前背景颜色（ANSI 限制）
- 💻 **终端兼容性**: 需要支持 ANSI 的现代终端（Windows 10+, 大多数 Linux/macOS 终端）
- 🖥️ **清屏**: 设置颜色时会清屏以应用新背景

---

## 项目结构

```
terminal-color/
├── terminal-bg.zig          # 主源代码
├── build.zig                 # 构建配置
├── CLAUDE.md                 # Claude Code 指导文档
├── README.md                 # 英文文档
├── README_CN.md              # 中文文档
├── RELEASE_SETUP.md          # Release 设置指南
├── package-release.sh        # 打包脚本
├── terminal-bg-quick.bat     # 快速使用批处理
├── .gitignore                # Git 忽略规则
└── .github/
    └── workflows/
        └── release.yml       # GitHub Actions 工作流
```

---

## 开发

### 构建命令

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

### 创建 Release

详细说明请参见 [RELEASE_SETUP.md](RELEASE_SETUP.md)。

```bash
# 创建并推送版本标签
git tag v1.0.0
git push origin v1.0.0

# GitHub Actions 会自动构建并发布
```

---

## 贡献

欢迎贡献！您可以：
- 🐛 报告错误
- 💡 建议新功能
- 🔧 提交拉取请求
- 📖 改进文档

---

## 许可证

MIT 许可证 - 详情见 [LICENSE](LICENSE) 文件。

---

## 致谢

- 使用 [Zig](https://ziglang.org/) 编程语言构建
- 源于对简单终端定制工具的需求
- 感谢 Zig 社区的文档和支持

---

## 支持

- 📖 [文档](CLAUDE.md)
- 🐛 [问题追踪](https://github.com/zhangj1164/terminal-color/issues)
- 💬 [讨论](https://github.com/zhangj1164/terminal-color/discussions)

---

**用 ❤️ 使用 Zig 制作**