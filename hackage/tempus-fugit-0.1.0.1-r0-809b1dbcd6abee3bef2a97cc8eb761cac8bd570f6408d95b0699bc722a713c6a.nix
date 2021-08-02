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
      identifier = { name = "tempus-fugit"; version = "0.1.0.1"; };
      license = "AGPL-3.0-only";
      copyright = "2015 Joshua Simmons";
      maintainer = "joshua.simmons@emptypath.com";
      author = "Joshua Simmons";
      homepage = "http://github.com/kadoban/tempus-fugit";
      url = "";
      synopsis = "Programmers' time tracker";
      description = "Track time spent on projects.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      exes = {
        "tempus" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tempus-fugit" or (errorHandler.buildDepError "tempus-fugit"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tempus-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tempus-fugit" or (errorHandler.buildDepError "tempus-fugit"))
            ];
          buildable = true;
          };
        };
      };
    }