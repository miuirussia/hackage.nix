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
      specVersion = "2.2";
      identifier = { name = "hasktorch-ffi-tests"; version = "0.0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sam Stites <fnz@fgvgrf.vb>, Austin Huang <nhfgvau@nyhz.zvg.rqh> - cipher:ROT13";
      author = "Hasktorch dev team";
      homepage = "https://github.com/hasktorch/hasktorch#readme";
      url = "";
      synopsis = "Testing library for Hasktorch's FFI bindings";
      description = "This includes basic tests which generalize over both Hasktorch's CPU and GPU FFI bindings.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."hasktorch-types-th" or (errorHandler.buildDepError "hasktorch-types-th"))
          (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
        buildable = true;
        };
      };
    }