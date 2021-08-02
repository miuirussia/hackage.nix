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
      identifier = { name = "pipes-ordered-zip"; version = "1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2019 Stephan Schiffels";
      maintainer = "stephan_schiffels@mac.com";
      author = "Stephan Schiffels";
      homepage = "https://github.com/githubuser/pipes-ordered-zip#readme";
      url = "";
      synopsis = "merge two ordered Producers into a new Producer";
      description = "provides a simple function to merge two Pipes-Producers into a new Producer that yields pairs of values of the original producers, but using Maybes to indicate values that are only present in the first, second or both producers. Useful to perform Left-Joins, Right-Joins and Inner-Joins on the fly using Haskell Pipes.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
          ];
        buildable = true;
        };
      tests = {
        "pipes-ordered-zip-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes-ordered-zip" or (errorHandler.buildDepError "pipes-ordered-zip"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."foldl" or (errorHandler.buildDepError "foldl"))
            ];
          buildable = true;
          };
        };
      };
    }