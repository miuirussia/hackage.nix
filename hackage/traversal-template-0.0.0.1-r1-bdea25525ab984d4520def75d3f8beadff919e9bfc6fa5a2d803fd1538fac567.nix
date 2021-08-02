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
      identifier = { name = "traversal-template"; version = "0.0.0.1"; };
      license = "MPL-2.0";
      copyright = "2020 M Farkas-Dyck";
      maintainer = "None";
      author = "M Farkas-Dyck";
      homepage = "https://github.com/strake/traversal-template.hs";
      url = "";
      synopsis = "See README for more info";
      description = "See README for more info";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."util" or (errorHandler.buildDepError "util"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."util" or (errorHandler.buildDepError "util"))
            (hsPkgs."traversal-template" or (errorHandler.buildDepError "traversal-template"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."util" or (errorHandler.buildDepError "util"))
            (hsPkgs."gauge" or (errorHandler.buildDepError "gauge"))
            (hsPkgs."traversal-template" or (errorHandler.buildDepError "traversal-template"))
            ];
          buildable = true;
          };
        };
      };
    }