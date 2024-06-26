// Copyright 2022 The IREE Authors
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#ifndef TORCH_IREE_INPUTCONVERSION_PASSES
#define TORCH_IREE_INPUTCONVERSION_PASSES

include "mlir/Pass/PassBase.td"

def BitCastQuantTensorPass :
    InterfacePass<"torch-iree-bitcast-quant-tensor", "mlir::FunctionOpInterface"> {
  let summary = "Bitcasts i8 packed tensors of sub-byte types to the actual bit width";
  let constructor = "mlir::iree_compiler::TorchInput::createBitCastQuantTensorPass()";
}

def ConvertTMTensorToLinalgExt :
    InterfacePass<"torch-iree-tm-tensor-to-linalg-ext", "mlir::FunctionOpInterface"> {
  let summary = "Convert from TMTensor ops to LinalgExt ops on tensors";
  let constructor = "mlir::iree_compiler::TorchInput::createConvertTMTensorToLinalgExtPass()";
}

def SetStrictSymbolicShapesPass :
    InterfacePass<"torch-iree-set-strict-symbolic-shapes", "mlir::FunctionOpInterface"> {
  let summary = "Adds the attribute indicating strict symbolic shapes in Torch IR";
  let constructor = "mlir::iree_compiler::TorchInput::createSetStrictSymbolicShapesPass()";
}

#endif // TORCH_IREE_INPUTCONVERSION_PASSES
