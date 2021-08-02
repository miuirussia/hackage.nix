{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {};
    package = {
      specVersion = "1.8";
      identifier = { name = "OpenCL"; version = "1.0.2.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2011 Luis Cabellos";
      maintainer = "Luis Cabellos";
      author = "Luis Cabellos";
      homepage = "https://github.com/zhensydow/opencl";
      url = "";
      synopsis = "Haskell high-level wrapper for OpenCL";
      description = "Haskell FFI binding to OpenCL library. It includes high-level wrappers to\nhelp development. Based on OpenCLRaw package.\n\nMost of the functions can throw a 'CLError' Exception. Using the module\n'Control.Exception' helps to work with this package Exceptions.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
        libs = (pkgs.lib).optional (!system.isWindows) (pkgs."OpenCL" or (errorHandler.sysDepError "OpenCL"));
        build-tools = [
          (hsPkgs.buildPackages.c2hs.components.exes.c2hs or (pkgs.buildPackages.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          ];
        buildable = true;
        };
      };
    }