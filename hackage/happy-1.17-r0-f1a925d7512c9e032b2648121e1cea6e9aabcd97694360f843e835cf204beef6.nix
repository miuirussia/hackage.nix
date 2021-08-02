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
    flags = { small_base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "happy"; version = "1.17"; };
      license = "BSD-3-Clause";
      copyright = "(c) Andy Gill, Simon Marlow";
      maintainer = "Simon Marlow <simonmar@microsoft.com>";
      author = "Andy Gill and Simon Marlow";
      homepage = "http://www.haskell.org/happy/";
      url = "";
      synopsis = "Happy is a parser generator for Haskell";
      description = "";
      buildType = "Custom";
      };
    components = {
      exes = {
        "happy" = {
          depends = [
            (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ] ++ (if flags.small_base
            then [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."array" or (errorHandler.buildDepError "array"))
              (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
              ]
            else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]);
          buildable = true;
          };
        };
      };
    }