(module
  (type (;0;) (func (param i64 i64 i32) (result i64)))
  (import "env" "memory" (memory (;0;) 20))
  
  (import "env" "ext_allocator_malloc_version_1" (func $ext_allocator_malloc_version_1 (param $0 i32) (result i32)))
  (import "env" "ext_allocator_free_version_1" (func $ext_allocator_free_version_1 (param $0 i32)))
  
  (global $__data_end i32 (i32.const 7))
  (export "__data_end" (global $__data_end))

  (global $__heap_base i32 (i32.const 13))
  (export "__heap_base" (global $__heap_base))

  (func $Core_version (param $ptr i32) (param $size i32) (result i64)
    i32.const 0
    i32.const 87
    i32.store ;; write 87 at memory index 0 (use the last 2 numbers from the stack)
    i64.const 0
    return
  )
  (export "Core_version" (func $Core_version))
)
