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
      identifier = { name = "lens-filesystem"; version = "0.0.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Chris Penner";
      maintainer = "example@example.com";
      author = "Chris Penner";
      homepage = "https://github.com/ChrisPenner/lens-filesystem#readme";
      url = "";
      synopsis = "";
      description = "Please see the README on GitHub at <https://github.com/ChrisPenner/lens-fs#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."lens-action" or (errorHandler.buildDepError "lens-action"))
          ];
        buildable = true;
        };
      tests = {
        "lens-filesystem-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lens-action" or (errorHandler.buildDepError "lens-action"))
            (hsPkgs."lens-filesystem" or (errorHandler.buildDepError "lens-filesystem"))
            ];
          buildable = true;
          };
        };
      };
    }