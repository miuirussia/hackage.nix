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
      specVersion = "1.2";
      identifier = { name = "haddock"; version = "0.8"; };
      license = "BSD-3-Clause";
      copyright = "(c) Simon Marlow";
      maintainer = "Simon Marlow <simonmar@microsoft.com>";
      author = "Simon Marlow";
      homepage = "http://www.haskell.org/haddock/";
      url = "";
      synopsis = "Haddock is a documentation-generation tool for Haskell libraries";
      description = "";
      buildType = "Custom";
      };
    components = {
      exes = {
        "haddock" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
            ];
          buildable = true;
          };
        };
      };
    }