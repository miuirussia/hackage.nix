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
      identifier = { name = "data-diverse"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 Louis Pan";
      maintainer = "louis@pan.me";
      author = "Louis Pan";
      homepage = "https://github.com/louispan/data-diverse#readme";
      url = "";
      synopsis = "Extensible records and polymorphic variants.";
      description = "\"Data.Diverse.Many\" is an extensible record for any size encoded efficiently as (Int, Map Int Any).\n\"Data.Diverse.Which\" is a polymorphic variant of possibilities encoded as (Int, Any).\nProvides getters, setters, projection, injection, fold, and catamorphisms;\naccessed by type or index.\nRefer to [ManySpec.hs](https://github.com/louispan/data-diverse/blob/master/test/Data/Diverse/ManySpec.hs) and [WhichSpec.hs](https://github.com/louispan/data-diverse/blob/master/test/Data/Diverse/WhichSpec.hs) for example usages.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          ];
        buildable = true;
        };
      tests = {
        "data-diverse-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-diverse" or (errorHandler.buildDepError "data-diverse"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            ];
          buildable = true;
          };
        };
      };
    }