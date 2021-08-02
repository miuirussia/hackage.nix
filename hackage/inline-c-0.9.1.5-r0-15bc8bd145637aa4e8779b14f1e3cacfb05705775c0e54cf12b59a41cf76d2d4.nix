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
    flags = { gsl-example = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "inline-c"; version = "0.9.1.5"; };
      license = "MIT";
      copyright = "(c) 2015-2016 FP Complete Corporation, (c) 2017-2019 Francesco Mazzoli";
      maintainer = "f@mazzo.li";
      author = "Francesco Mazzoli, Mathieu Boespflug";
      homepage = "";
      url = "";
      synopsis = "Write Haskell source files including C code inline. No FFI required.";
      description = "See <https://github.com/fpco/inline-c/blob/master/README.md>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ansi-wl-pprint" or (errorHandler.buildDepError "ansi-wl-pprint"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."parsers" or (errorHandler.buildDepError "parsers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "gsl-ode" = {
          depends = (pkgs.lib).optionals (flags.gsl-example) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."inline-c" or (errorHandler.buildDepError "inline-c"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."Chart" or (errorHandler.buildDepError "Chart"))
            (hsPkgs."Chart-cairo" or (errorHandler.buildDepError "Chart-cairo"))
            ];
          libs = [
            (pkgs."gsl" or (errorHandler.sysDepError "gsl"))
            (pkgs."gslcblas" or (errorHandler.sysDepError "gslcblas"))
            (pkgs."m" or (errorHandler.sysDepError "m"))
            ];
          buildable = if flags.gsl-example then true else false;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."ansi-wl-pprint" or (errorHandler.buildDepError "ansi-wl-pprint"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."inline-c" or (errorHandler.buildDepError "inline-c"))
            (hsPkgs."parsers" or (errorHandler.buildDepError "parsers"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
            (hsPkgs."regex-posix" or (errorHandler.buildDepError "regex-posix"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            ];
          buildable = true;
          };
        };
      };
    }