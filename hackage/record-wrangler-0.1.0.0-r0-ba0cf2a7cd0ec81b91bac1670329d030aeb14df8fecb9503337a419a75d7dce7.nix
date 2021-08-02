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
      identifier = { name = "record-wrangler"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Matt Parsons";
      maintainer = "parsonsmatt@gmail.com";
      author = "Matt Parsons";
      homepage = "https://github.com/parsonsmatt/record-wrangler#readme";
      url = "";
      synopsis = "Alter your records with ease";
      description = "Please see the README on GitHub at <https://github.com/parsonsmatt/record-wrangler#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      tests = {
        "record-wrangler-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."record-wrangler" or (errorHandler.buildDepError "record-wrangler"))
            ];
          buildable = true;
          };
        };
      };
    }