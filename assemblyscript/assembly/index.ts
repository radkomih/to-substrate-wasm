// imported function from the host
import { ext_allocator_malloc_version_1, ext_allocator_free_version_1 } from "./env"

// exported functions from the Wasm module
export function Core_version(ptr: i32, len: i32): i64 {
  ext_allocator_malloc_version_1(1)
  ext_allocator_free_version_1(1)
  return i64(0);
}