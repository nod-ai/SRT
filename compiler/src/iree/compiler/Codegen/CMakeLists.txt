################################################################################
# Autogenerated by build_tools/bazel_to_cmake/bazel_to_cmake.py from           #
# compiler/src/iree/compiler/Codegen/BUILD.bazel                               #
#                                                                              #
# Use iree_cmake_extra_content from iree/build_defs.oss.bzl to add arbitrary   #
# CMake-only content.                                                          #
#                                                                              #
# To disable autogeneration for this file entirely, delete this header.        #
################################################################################

iree_add_all_subdirs()

iree_cc_library(
  NAME
    Codegen
  HDRS
    "Passes.h"
  SRCS
    "Passes.cpp"
  DEPS
    IREELinalgExtPasses
    MLIRPass
    iree::compiler::Codegen::Common
    iree::compiler::Codegen::Common::CPU::CommonCPUPasses
    iree::compiler::Codegen::Common::GPU::CommonGPUPasses
    iree::compiler::Codegen::Dialect::Codegen::IR::IREECodegenDialect
    iree::compiler::Codegen::LLVMCPU
    iree::compiler::Codegen::LLVMGPU
    iree::compiler::Codegen::SPIRV
    iree::compiler::Codegen::VMVX
    iree::compiler::Codegen::WGSL
  PUBLIC
)

### BAZEL_TO_CMAKE_PRESERVES_ALL_CONTENT_BELOW_THIS_LINE ###
