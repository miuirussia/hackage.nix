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
      specVersion = "1.12";
      identifier = { name = "cabal-build-programs"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Aditya Siram, 2019";
      maintainer = "aditya.siram@gmail.com";
      author = "Aditya Siram";
      homepage = "https://github.com/deech/cabal-build-programs#readme";
      url = "";
      synopsis = "Adds executable dependencies to the Cabal build";
      description = "Please see the README on GitHub at <https://github.com/deech/cabal-build-programs#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
        buildable = true;
        };
      };
    }