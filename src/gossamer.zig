//! Root Zig module for gossamer.
//! Most code is in included C source files, but we need to define some
//! functions here.

const std = @import("std");

const MzAllocator = @import("MzAllocator.zig");

// End of the .bss section (defined in saml22n18.ld)
extern const _end: u8;
// End of the stack (defined in saml22n18.ld)
extern const _stack_top: u8;

// TODO: Use the heap
var mz_allocator_buf: [4096]u8 = undefined;
var mz_allocator: MzAllocator = undefined;
// HACK:? This is taking a pointer to an undefined allocator. I think this is actually
// ok, because it is by-pointer, and the allocator gets initialized in `app_init`.
var gpa: std.mem.Allocator = mz_allocator.allocator();

export fn malloc(size: usize) ?*anyopaque {
    const buf = gpa.rawAlloc(8 + size, .@"8", @returnAddress()) orelse {
        return null;
    };

    const alloc_len: *usize = @ptrCast(@alignCast(buf));
    alloc_len.* = size;
    return @ptrFromInt(@intFromPtr(buf) + 8);
}

export fn memalign(alignment: usize, size: usize) ?*anyopaque {
    const buf = gpa.rawAlloc(8 + size, .fromByteUnits(alignment), @returnAddress()) orelse {
        return null;
    };

    const alloc_len: *usize = @ptrCast(@alignCast(buf));
    alloc_len.* = size;
    return @ptrFromInt(@intFromPtr(buf) + 8);
}

export fn free(ptr: ?*anyopaque) void {
    if (ptr == null) return;

    const buf_ptr: [*]u8 = @ptrFromInt(@intFromPtr(ptr) - 8);
    const buf_len: *usize = @ptrCast(@alignCast(buf_ptr));
    gpa.rawFree(buf_ptr[0 .. @sizeOf(usize) + buf_len.*], .@"8", @returnAddress());
}

// ===== App functions ===== //

pub const Options = struct {
    initFn: fn () void,
    setupFn: fn () void,
    loopFn: fn () bool,
};

const app = @import("app");
const options: Options = if (@hasDecl(app, "gossamer_options")) app.gossamer_options else @compileError("app does not declare gossamer_options");

export fn app_init() void {
    mz_allocator = MzAllocator.init_with_heap(0x4000) catch unreachable;
    options.initFn();
}
export fn app_setup() void {
    options.setupFn();
}
export fn app_loop() bool {
    return options.loopFn();
}
