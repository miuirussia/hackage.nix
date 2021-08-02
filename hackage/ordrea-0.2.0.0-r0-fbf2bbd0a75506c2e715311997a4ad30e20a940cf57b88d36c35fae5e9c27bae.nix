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
      specVersion = "1.8";
      identifier = { name = "ordrea"; version = "0.2.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "Takano Akio <aljee@hyper.cx>";
      author = "Takano Akio, Andrew Richards";
      homepage = "";
      url = "";
      synopsis = "Push-pull implementation of discrete-time FRP";
      description = "This is an FRP library with the following characteristics:\n\n* classical: it has first-class signals\n\n* synchronous: it has a clear notion of simultaneous events\n\n* higher-order: signals inside signals can be flattened\nto get a switching behavior\n\n* push-based: inactive events has zero runtime costs\n\nThis package is in the alpha stage.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "unit-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ordrea" or (errorHandler.buildDepError "ordrea"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      };
    }