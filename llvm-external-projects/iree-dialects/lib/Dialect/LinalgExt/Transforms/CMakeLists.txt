add_mlir_library(IREELinalgExtTransforms
  ForeachThreadToAsync.cpp

  PARTIAL_SOURCES_INTENDED
  DEPENDS
  mlir-headers
  IREELinalgExtDialect

  LINK_LIBS PUBLIC
  IREELinalgExtDialect

  MLIRAffineToStandard
  MLIRAsyncDialect
  MLIRSCFToControlFlow
  MLIRDialectUtils
  MLIRVectorToLLVM
  MLIRMathToLLVM
  MLIRMemRefToLLVM
  MLIRIR
  MLIRMathDialect
  MLIRLinalgDialect
  MLIRLinalgTransforms
  MLIRPass
  MLIRSCFDialect
  MLIRTensorTransforms
  MLIRTransforms
)
