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
      identifier = {
        name = "hasktorch-signatures-partial";
        version = "0.0.1.0";
        };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sam Stites <fnz@fgvgrf.vb>, Austin Huang <nhfgvau@nyhz.zvg.rqh> - cipher:ROT13";
      author = "Hasktorch dev team";
      homepage = "https://github.com/hasktorch/hasktorch#readme";
      url = "";
      synopsis = "Functions to partially satisfy tensor signatures";
      description = "Undefined functions to satisfy backpack signatures (never be exported in core)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hasktorch-types-th" or (errorHandler.buildDepError "hasktorch-types-th"))
          (hsPkgs."hasktorch-signatures-types" or (errorHandler.buildDepError "hasktorch-signatures-types"))
          ];
        buildable = true;
        };
      };
    }