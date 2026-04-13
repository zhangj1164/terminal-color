const std = @import("std");
const builtin = @import("builtin");

const Color = enum {
    black,
    red,
    green,
    yellow,
    blue,
    magenta,
    cyan,
    white,
    default_,
    bright_black,
    bright_red,
    bright_green,
    bright_yellow,
    bright_blue,
    bright_magenta,
    bright_cyan,
    bright_white,

    fn toAnsiBg(self: Color) []const u8 {
        return switch (self) {
            .black => "\x1b[40m",
            .red => "\x1b[41m",
            .green => "\x1b[42m",
            .yellow => "\x1b[43m",
            .blue => "\x1b[44m",
            .magenta => "\x1b[45m",
            .cyan => "\x1b[46m",
            .white => "\x1b[47m",
            .default_ => "\x1b[49m",
            .bright_black => "\x1b[100m",
            .bright_red => "\x1b[101m",
            .bright_green => "\x1b[102m",
            .bright_yellow => "\x1b[103m",
            .bright_blue => "\x1b[104m",
            .bright_magenta => "\x1b[105m",
            .bright_cyan => "\x1b[106m",
            .bright_white => "\x1b[107m",
        };
    }

    fn fromString(s: []const u8) ?Color {
        const map = std.StaticStringMap(Color).initComptime(.{
            .{ "black", .black },
            .{ "red", .red },
            .{ "green", .green },
            .{ "yellow", .yellow },
            .{ "blue", .blue },
            .{ "magenta", .magenta },
            .{ "cyan", .cyan },
            .{ "white", .white },
            .{ "default", .default_ },
            .{ "bright-black", .bright_black },
            .{ "bright-red", .bright_red },
            .{ "bright-green", .bright_green },
            .{ "bright-yellow", .bright_yellow },
            .{ "bright-blue", .bright_blue },
            .{ "bright-magenta", .bright_magenta },
            .{ "bright-cyan", .bright_cyan },
            .{ "bright-white", .bright_white },
        });
        return map.get(s);
    }
};

// ========== Windows 实现 ==========
const WindowsTerminal = struct {
    fn getCurrentColor() !Color {
        // Windows cannot reliably query current background color via console API
        // Return default with a warning
        std.debug.print("Warning: Cannot reliably detect background color on Windows terminals.\n", .{});
        return .default_;
    }

    fn setColor(color: Color) !void {
        // Modern Windows 10+ supports ANSI escape sequences
        // Use std.debug.print for simplicity (handles Io internally)
        std.debug.print("{s}\x1b[2J\x1b[H", .{color.toAnsiBg()});
    }
};

// ========== Unix-like 实现 ==========
const UnixTerminal = struct {
    fn getCurrentColor() !Color {
        // Cannot reliably query current background color via ANSI sequences
        std.debug.print("Warning: Cannot reliably detect background color on Unix terminals.\n", .{});
        return .default_;
    }

    fn setColor(color: Color) !void {
        // Use std.debug.print for simplicity
        std.debug.print("{s}\x1b[2J\x1b[H", .{color.toAnsiBg()});
    }
};

// ========== 主程序 ==========
pub fn main(init: std.process.Init.Minimal) !void {
    var args_iter = std.process.Args.Iterator.initAllocator(init.args, std.heap.page_allocator) catch |err| {
        std.debug.print("Error: Failed to initialize args iterator: {}\n", .{err});
        return err;
    };
    defer args_iter.deinit();

    // Skip program name
    _ = args_iter.next();

    const command = args_iter.next() orelse {
        std.debug.print("Usage: terminal-bg <command> [options]\n", .{});
        std.debug.print("Commands: get, set <color>, list\n", .{});
        return error.InvalidArgs;
    };

    if (std.mem.eql(u8, command, "get")) {
        // 获取当前背景色
        const color = if (builtin.os.tag == .windows)
            try WindowsTerminal.getCurrentColor()
        else
            try UnixTerminal.getCurrentColor();

        std.debug.print("Current background color: {s}\n", .{@tagName(color)});
    } else if (std.mem.eql(u8, command, "set")) {
        // 设置背景色
        const color_name = args_iter.next() orelse {
            std.debug.print("Error: 'set' requires a color name\n", .{});
            printColors();
            return error.InvalidArgs;
        };

        const color = Color.fromString(color_name) orelse {
            std.debug.print("Error: Unknown color '{s}'\n", .{color_name});
            printColors();
            return error.UnknownColor;
        };

        if (builtin.os.tag == .windows) {
            try WindowsTerminal.setColor(color);
        } else {
            try UnixTerminal.setColor(color);
        }

        std.debug.print("Background color set to: {s}\n", .{color_name});
    } else if (std.mem.eql(u8, command, "list")) {
        // 列出所有可用颜色
        printColors();
        std.debug.print("\n", .{});
    } else {
        std.debug.print("Error: Unknown command '{s}'\n", .{command});
        std.debug.print("Commands: get, set <color>, list\n", .{});
        return error.UnknownCommand;
    }
}

fn printColors() void {
    std.debug.print("Available colors:\n", .{});
    std.debug.print("  Standard: black, red, green, yellow, blue, magenta, cyan, white\n", .{});
    std.debug.print("  Bright:   bright-black, bright-red, bright-green, bright-yellow,\n", .{});
    std.debug.print("            bright-blue, bright-magenta, bright-cyan, bright-white\n", .{});
    std.debug.print("  Special:  default (reset to terminal default)\n", .{});
}
