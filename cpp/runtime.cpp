#include "runtime.hpp"

WASM_EXPORT uint64_t Core_version(uint32_t dataPtr, uint32_t dataSize)
{
  // Use the external memory management functions to allocate/dellocate memory
  // uint8_t *mem = &memory;
  ext_allocator_malloc_version_1(0);
  ext_allocator_free_version_1(0);

  return uint64_t(dataPtr + dataSize) | (uint64_t(dataSize + dataSize) << 32);
}
