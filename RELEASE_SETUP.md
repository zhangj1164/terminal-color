# GitHub Release 设置指南

本项目已配置自动化 release 流程。当您推送版本 tag 时，GitHub Actions 会自动构建并发布可执行文件。

## 快速开始

### 1. 创建 GitHub 仓库

如果您还没有创建 GitHub 仓库：

1. 访问 https://github.com/new
2. 仓库名称建议：`terminal-color` 或 `terminal-bg`
3. 选择 Public 或 Private
4. 不要初始化 README（我们已经有了）
5. 点击 "Create repository"

### 2. 配置远程仓库并推送

```bash
# 添加远程仓库（替换 YOUR_USERNAME 为您的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/terminal-color.git

# 推送代码到 GitHub
git push -u origin master
```

### 3. 创建第一个 Release

有两种方式：

#### 方式 A：使用 Git Tag（推荐）

```bash
# 创建并推送 v1.0.0 tag
git tag v1.0.0
git push origin v1.0.0
```

这会触发 GitHub Actions 自动：
- 构建 Windows 可执行文件
- 创建 ZIP 包
- 发布到 GitHub Releases

#### 方式 B：手动上传（已创建的包）

如果您想立即使用已创建的包：

1. 访问仓库的 **Releases** 页面
2. 点击 **Draft a new release**
3. 输入：
   - Tag: `v1.0.0`
   - Title: `Terminal Background Color Tool v1.0.0`
4. 上传文件：`terminal-bg-v1.0.0-windows-x64.zip`
5. 填写 release 说明（可复制下面的模板）
6. 点击 **Publish release**

## Release 说明模板

```markdown
## Terminal Background Color Tool

A cross-platform CLI tool for setting terminal background colors using ANSI escape sequences.

### Features
- 17 color options (8 standard + 8 bright + default)
- Works on Windows 10+ and Unix-like systems
- Zig 0.16 compatible

### Installation
Download and extract the zip file, then run:
```bash
terminal-bg.exe set blue
```

### Usage
```bash
terminal-bg.exe list      # List all colors
terminal-bg.exe set blue  # Set background color
terminal-bg.exe set default  # Reset to default
```

### Available Colors
**Standard**: black, red, green, yellow, blue, magenta, cyan, white
**Bright**: bright-black, bright-red, bright-green, bright-yellow, bright-blue, bright-magenta, bright-cyan, bright-white
**Special**: default

See included README.md and USAGE.txt for detailed instructions.
```

## 自动化 Release 流程说明

### GitHub Actions Workflow

文件 `.github/workflows/release.yml` 配置了自动化流程：

**触发条件**：推送 `v*` 格式的 tag（如 v1.0.0, v1.1.0）

**执行步骤**：
1. 在 Windows runner 上构建项目
2. 创建包含可执行文件和文档的 ZIP 包
3. 自动创建 GitHub Release
4. 上传构建产物到 Release

### 发布新版本

```bash
# 更新代码后，创建新版本 tag
git tag v1.1.0
git push origin v1.1.0

# GitHub Actions 会自动构建并发布新版本
```

## 手动打包（可选）

如果需要手动创建包，运行：

```bash
bash package-release.sh
```

这会创建 `terminal-bg-v1.0.0-windows-x64.zip` 文件。

## 验证 Release

推送 tag 后，访问：
- **Actions** 页面查看构建状态
- **Releases** 页面查看发布的产物

构建通常需要 1-2 分钟完成。

## 故障排查

### 问题：Actions 失败
- 检查 `.github/workflows/release.yml` 文件格式
- 确认 Zig 版本设置正确
- 查看 Actions 日志获取详细错误信息

### 问题：找不到 Zig
- workflow 使用 `goto-bus-stop/setup-zig@v2` 安装 Zig
- 当前配置版本：`0.16.0-dev.3133`
- 如需更新版本，修改 workflow 文件中的 version 参数

### 问题：权限错误
- 确认仓库设置了 `GITHUB_TOKEN`（默认自动提供）
- 检查仓库设置 → Actions → General → Workflow permissions

## 下一步

1. ✅ 本地包已创建：`terminal-bg-v1.0.0-windows-x64.zip`
2. 📝 创建 GitHub 仓库
3. 🔗 配置远程仓库
4. 🚀 推送代码和 tag

完成后，您的用户可以直接从 GitHub Releases 下载预编译的可执行文件！