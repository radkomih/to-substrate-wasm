build_wat:
	wat2wasm \
		-o build/runtime.wasm \
		wat/runtime.wat

build_cpp:
	clang++ \
		--target=wasm32 \
		-nostdlib \
		-O3 \
		-flto \
		-c \
		-o build/runtime.o \
		cpp/runtime.cpp
	
	wasm-ld \
		--no-entry \
		--export="__heap_base" \
		--export="__data_end" \
		--export-dynamic \
		--export-table \
		--import-memory \
		--allow-undefined \
		--lto-O3 \
		-o build/runtime.wasm \
		build/runtime.o
	
	rm build/runtime.o

build_zig:
	zig build-obj \
		-target wasm32-freestanding \
		zig/runtime.zig

	zig clang \
		-target wasm32-freestanding \
		-nostdlib \
		-O3 \
		-flto \
		-Wl,--allow-undefined \
		-Wl,--export="__heap_base" \
		-Wl,--export="__data_end" \
		-Wl,--export-dynamic \
		-Wl,--export-table -Wl,--no-entry \
		-Wl,--import-memory \
		-Wl,--lto-O3 \
		-nostdlib \
		-o build/runtime.wasm \
		build/runtime.o

	rm build/runtime.o

build_rs:
	rustc \ 
		+nightly \
		--target=wasm32-unknown-unknown \
		-C link-arg=--import-memory \
		-C link-arg=--export-table \
		-O --crate-type=cdylib \
		rust/runtime.rs 

build_as:
	cd assemblyscript && npm run asbuild:release && mv build/release.wasm ../build/runtime.wasm

build_gr:
	grain compile runtime.gr

build_go: 
	tinygo build -wasm-abi=generic -target=wasi -gc=none -scheduler=none -o=build/runtime.wasm tinygo/runtime.go

inspect:
	wasmer inspect build/runtime.wasm

# wat2wasm wat/runtime.wat -v