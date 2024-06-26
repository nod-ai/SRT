// Copyright 2023 The IREE Authors
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#ifndef IREE_PREPROCESSING_COMMON_PASSES
#define IREE_PREPROCESSING_COMMON_PASSES

include "mlir/Pass/PassBase.td"

def ConvertConv2DToImg2Col :
    Pass<"iree-preprocessing-convert-conv2d-to-img2col", ""> {
  let summary = "Convert linalg convolution ops to matmul img2col based implementation";
  let constructor = "mlir::iree_compiler::Preprocessing::createConvertConv2DToImg2ColPass()";
  let dependentDialects = [
    "mlir::linalg::LinalgDialect",
  ];
}

def InterpreterPass : Pass<"iree-preprocessing-transform-interpreter"> {
  let summary = "transform dialect interpreter";
  let description = [{
    This pass runs the transform dialect interpreter and applies the named
    sequence transformation named `__transform_main`.

    TODO: Drop this pass in favor of the one upstream. The one upstream requires
    separate loading of the module and thus isn't suited for single-use
    transform scripts.
  }];
  let dependentDialects = ["::mlir::transform::TransformDialect"];
  let options = [
    Option<"disableExpensiveChecks", "disable-expensive-checks", "bool",
           "false",
           "Disable expensive checks in the interpreter for a faster run.">,
    Option<"transformSpecPath", "transform-spec-path", "std::string",
           /*default=*/"", "File path to the transform spec to use.">,
  ];
}

def ConvertConvNchwToNhwc :
    InterfacePass<"iree-flow-convert-conv-nchw-to-nhwc", "mlir::FunctionOpInterface"> {
  let summary = "Convert linalg NCHW Convolutions to NHWC";
  let constructor =
      "mlir::iree_compiler::Preprocessing::createConvertConvNchwToNhwcPass()";
}

def MakeSingleDispatchForFunction :
    InterfacePass<"iree-preprocessing-make-single-dispatch-for-function", "mlir::FunctionOpInterface"> {
  let summary = "Convert entire function into a single dispatch";
  let constructor = "mlir::iree_compiler::Preprocessing::createMakeSingleDispatchForFunctionPass()";
  let dependentDialects = [
    "IREE::Flow::FlowDialect",
  ];
}

def GeneralizeConvolutions :
    Pass<"iree-preprocessing-generalize-convolutions", ""> {
  let summary = "Generalize all convolution ops";
  let constructor = "mlir::iree_compiler::Preprocessing::createGeneralizeConvolutionsPass()";
}

def ConvertConvToChannelsLast :
    Pass<"iree-preprocessing-convert-conv-to-channels-last", ""> {
  let summary = "Convert linalg convolutions to channels last.";
  let constructor =
      "mlir::iree_compiler::Preprocessing::createConvertConvToChannelsLastPass()";
  let options = [
    Option<"tileSize", "tile-size", "int",
           /*default=*/"0",
           "Specify the tiling factor">,
  ];
}

def PadLinalgOps :
    Pass<"iree-preprocessing-pad-linalg-ops", ""> {
  let summary = "Pad linalg ops to the next integer multiple of paddingSize.";
  let constructor = "mlir::iree_compiler::Preprocessing::createPadLinalgOpsToIntegerMultiplePass()";
  let options = [
    Option<"paddingSize", "pad-size", "int",
           /*default=*/"4",
           "Specify the padding size">,
  ];
  let dependentDialects = [
    "mlir::linalg::LinalgDialect",
  ];
}

#endif  // IREE_PREPROCESSING_COMMON_PASSES
