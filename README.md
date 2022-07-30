**Substrate's Wasm interface example**

```
Type: wasm
Size: 2.5 MB
Imports:
  Functions:
    "env"."ext_allocator_free_version_1": [I32] -> []
    "env"."ext_allocator_malloc_version_1": [I32] -> [I32]
    ...
  Memories:
    "env"."memory": not shared (20 pages..)
  Tables:
  Globals:
Exports:
  Functions:
    "Core_version": [I32, I32] -> [I64]
    "Core_execute_block": [I32, I32] -> [I64]
    "Core_initialize_block": [I32, I32] -> [I64]
    ...
  Memories:
  Tables:
    "__indirect_function_table": FuncRef (352..352)
  Globals:
    "__data_end": I32 (constant)
    "__heap_base": I32 (constant)
```

**C++**
* LLVM + no GC

**Zig**
* LLVM + no GC

**Rust**
* LLVM + no GC (eagerly collects memory before returning from a Wasm function)

**Swift**
* LLVM + no GC (automatic reference counting)

**AssemblyScript**
* Binaryen + GC

**TinygGo**
* LLVM + GC
