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
      specVersion = "1.6";
      identifier = { name = "feldspar-compiler"; version = "0.5.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2009-2011, ERICSSON AB";
      maintainer = "deva@inf.elte.hu";
      author = "Feldspar group,\nEotvos Lorand University Faculty of Informatics";
      homepage = "http://feldspar.inf.elte.hu/feldspar/";
      url = "";
      synopsis = "Compiler for the Feldspar language";
      description = "Feldspar (**F**unctional **E**mbedded **L**anguage for **DSP**\nand **PAR**allelism) is an embedded DSL for describing digital\nsignal processing algorithms.\nThis library (FeldsparCompiler) contains a prototype compiler\nthat supports C code generation from programs written in this\nlanguage both according to ANSI C and also targeted to a real\nDSP HW.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."feldspar-language" or (errorHandler.buildDepError "feldspar-language"))
          (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."haskell-src-exts" or (errorHandler.buildDepError "haskell-src-exts"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hint" or (errorHandler.buildDepError "hint"))
          (hsPkgs."MonadCatchIO-mtl" or (errorHandler.buildDepError "MonadCatchIO-mtl"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."syntactic" or (errorHandler.buildDepError "syntactic"))
          ];
        buildable = true;
        };
      exes = {
        "feldspar" = {
          depends = [
            (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
            ];
          buildable = true;
          };
        };
      };
    }