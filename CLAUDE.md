# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A cross-platform Zig CLI tool for getting and setting terminal background colors. Supports both standard and bright color variants on Windows and Unix-like systems.

## Build Commands

```bash
# Build the executable
zig build

# Run with arguments
zig build run -- get
zig build run -- set blue
zig build run -- list

# Install to zig-out/bin
zig build install
```

## Zig 0.16 Compatibility

**Build system**: Uses `root_module` API instead of deprecated `root_source_file`:
```zig
const exe = b.addExecutable(.{
    .name = "terminal-bg",
    .root_module = b.createModule(.{
        .root_source_file = b.path("terminal-bg.zig"),
        .target = target,
        .optimize = optimize,
    }),
});
```

**Main function signature**: Accepts `std.process.Init.Minimal` parameter for argument access:
```zig
pub fn main(init: std.process.Init.Minimal) !void {
    var args_iter = std.process.Args.Iterator.initAllocator(init.args, std.heap.page_allocator) catch |err| {
        return err;
    };
    defer args_iter.deinit();
    // Use args_iter.next() to iterate through arguments
}
```

**I/O approach**: Uses `std.debug.print()` for output instead of complex `std.Io.File.Writer` setup, which simplifies the code and avoids the need to manage Io instances.

## Architecture

**Single-file structure**: `terminal-bg.zig` contains all application logic.

**Platform abstraction**: Both platforms now use ANSI escape sequences for consistency:
- `WindowsTerminal`: Modern Windows 10+ terminals support ANSI codes; uses `\x1b[4Xm` for background colors
- `UnixTerminal`: Uses ANSI escape sequences (`\x1b[4Xm` for background, `\x1b[2J` for clear screen, `\x1b[H` for cursor reset)

**Color handling**: The `Color` enum provides:
- `toAnsiBg()`: Generates ANSI escape codes (works on both Windows and Unix)
- `fromString()`: Parses color names from CLI arguments using compile-time `std.StaticStringMap`

**Platform limitations**: Both Windows and Unix cannot reliably query current background color, so `getCurrentColor()` returns `.default_` with a warning on all platforms.

**Unified approach**: Removed complex Win32 API calls (`GetConsoleScreenBufferInfo`, `SetConsoleTextAttribute`) in favor of ANSI sequences that work across modern terminals on all platforms.

## CLI Commands

- `get`: Print current background color (returns "default" with warning on all platforms)
- `set <color>`: Set background color and clear screen using ANSI sequences
- `list`: Display all 17 available colors (8 standard + 8 bright + default)