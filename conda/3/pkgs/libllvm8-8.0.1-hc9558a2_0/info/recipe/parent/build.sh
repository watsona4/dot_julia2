set -x

# Make osx work like linux.
sed -i.bak "s/NOT APPLE AND ARG_SONAME/ARG_SONAME/g" cmake/modules/AddLLVM.cmake
sed -i.bak "s/NOT APPLE AND NOT ARG_SONAME/NOT ARG_SONAME/g" cmake/modules/AddLLVM.cmake

mkdir build
cd build

[[ $(uname) == Linux ]] && conditional_args="
      -DLLVM_USE_INTEL_JITEVENTS=ON
"

if [[ "$target_platform" == "osx-64" ]]; then
    export CONDA_BUILD_SYSROOT_BACKUP=${CONDA_BUILD_SYSROOT}
    conda install -p $BUILD_PREFIX --quiet --yes clangxx_osx-64=${cxx_compiler_version}
    export CONDA_BUILD_SYSROOT=${CONDA_BUILD_SYSROOT_BACKUP}
    export CFLAGS="$CFLAGS -isysroot $CONDA_BUILD_SYSROOT"
    export CXXFLAGS="$CXXFLAGS -isysroot $CONDA_BUILD_SYSROOT"
    export LDFLAGS="$LDFLAGS -isysroot $CONDA_BUILD_SYSROOT"
fi

cmake -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_RTTI=ON \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_INCLUDE_GO_TESTS=OFF \
      -DLLVM_INCLUDE_UTILS=ON \
      -DLLVM_INCLUDE_DOCS=OFF \
      -DLLVM_INCLUDE_EXAMPLES=OFF \
      -DLLVM_ENABLE_TERMINFO=OFF \
      -DLLVM_ENABLE_LIBXML2=OFF \
      -DLLVM_ENABLE_ZLIB=OFF \
      -DHAVE_LIBEDIT=OFF \
      -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly \
      -DLLVM_BUILD_LLVM_DYLIB=yes \
      -DLLVM_LINK_LLVM_DYLIB=yes \
      ${conditional_args} ..

make -j${CPU_COUNT}

if [[ "${target_platform}" == "linux-64" || "${target_platform}" == "osx-64" ]]; then
    export TEST_CPU_FLAG="-mcpu=haswell"
else
    export TEST_CPU_FLAG=""
fi

bin/opt -S -vector-library=SVML $TEST_CPU_FLAG -O3 $RECIPE_DIR/numba-3016.ll | bin/FileCheck $RECIPE_DIR/numba-3016.ll || exit $?
#cd ../test
#../build/bin/llvm-lit -vv Transforms ExecutionEngine Analysis CodeGen/X86
