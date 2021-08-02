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
      identifier = { name = "sql-words"; version = "0.1.3.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2013 Kei Hibino";
      maintainer = "ex8k.hibino@gmail.com";
      author = "Kei Hibino";
      homepage = "http://khibino.github.io/haskell-relational-record/";
      url = "";
      synopsis = "Simple idea SQL keywords data constructor into OverloadedString";
      description = "This package contiains SQL keywords constructors defined as\nOverloadedString literals and helper functions to concate these.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      tests = {
        "monoids" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabal-test-compat" or (errorHandler.buildDepError "cabal-test-compat"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."sql-words" or (errorHandler.buildDepError "sql-words"))
            ];
          buildable = true;
          };
        };
      };
    }