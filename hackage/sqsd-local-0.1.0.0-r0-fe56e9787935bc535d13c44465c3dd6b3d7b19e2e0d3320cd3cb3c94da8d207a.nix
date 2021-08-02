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
      identifier = { name = "sqsd-local"; version = "0.1.0.0"; };
      license = "MPL-2.0";
      copyright = "AllRightsReserved";
      maintainer = "oskar.wickstrom@gmail.com";
      author = "Oskar Wickström";
      homepage = "https://github.com/owickstrom/sqsd-local#readme";
      url = "";
      synopsis = "Initial project template from stack";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      exes = {
        "sqsd-local" = {
          depends = [
            (hsPkgs."amazonka" or (errorHandler.buildDepError "amazonka"))
            (hsPkgs."amazonka-sqs" or (errorHandler.buildDepError "amazonka-sqs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."wreq" or (errorHandler.buildDepError "wreq"))
            ];
          buildable = true;
          };
        };
      tests = {
        "sqsd-local-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."sqsd-local" or (errorHandler.buildDepError "sqsd-local"))
            ];
          buildable = true;
          };
        };
      };
    }