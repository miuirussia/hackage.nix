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
      identifier = { name = "polysemy-chronos"; version = "0.2.0.1"; };
      license = "BSD-2-Clause-Patent";
      copyright = "2021 Torsten Schmits";
      maintainer = "tek@tryp.io";
      author = "Torsten Schmits";
      homepage = "";
      url = "";
      synopsis = "Polysemy-time Interpreters for Chronos";
      description = "Please see the readme on Github at <https://github.com/tek/polysemy-time>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."chronos" or (errorHandler.buildDepError "chronos"))
          (hsPkgs."polysemy" or (errorHandler.buildDepError "polysemy"))
          (hsPkgs."polysemy-time" or (errorHandler.buildDepError "polysemy-time"))
          ];
        buildable = true;
        };
      tests = {
        "polysemy-chronos-unit" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."chronos" or (errorHandler.buildDepError "chronos"))
            (hsPkgs."polysemy-chronos" or (errorHandler.buildDepError "polysemy-chronos"))
            (hsPkgs."polysemy-test" or (errorHandler.buildDepError "polysemy-test"))
            (hsPkgs."polysemy-time" or (errorHandler.buildDepError "polysemy-time"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            ];
          buildable = true;
          };
        };
      };
    }