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
      specVersion = "1.10";
      identifier = { name = "wide-word"; version = "0.1.0.5"; };
      license = "BSD-2-Clause";
      copyright = "Copyright (c) 2017 Erik de Castro Lopo <erikd@mega-nerd.com>";
      maintainer = "erikd@mega-nerd.com";
      author = "Erik de Castro Lopo";
      homepage = "https://github.com/erikd/wide-word";
      url = "";
      synopsis = "Data types for large but fixed width signed and unsigned integers";
      description = "A library to provide data types for large (ie > 64 bits) but fixed width signed\nand unsigned integers with the usual typeclass instances to allow them to be used\ninterchangeably with `Word64`.\n\nThe types and operations are coded to be as fast as possible using strictness\nannotations, `INLINEABLE` pragmas and unboxed values and operations where\nappropriate.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."wide-word" or (errorHandler.buildDepError "wide-word"))
            ];
          buildable = true;
          };
        };
      };
    }