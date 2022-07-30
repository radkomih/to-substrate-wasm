// host imported functions
extern fn ext_allocator_malloc_version_1(size: i32) i32;
extern fn ext_allocator_free_version_1(ptr: i32) void;

// module exported functions
export fn Core_version(ptr: i32, size: i32) i64 {
    _ = ext_allocator_malloc_version_1(0);
    ext_allocator_free_version_1(0);
    return 0;
}
