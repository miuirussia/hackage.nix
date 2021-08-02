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
      specVersion = "1.0";
      identifier = { name = "collections"; version = "0.3.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "NONE";
      author = "Jean-Philippe Bernardy, Adrian Hey and others (see AUTHORS file)";
      homepage = "";
      url = "";
      synopsis = "Useful standard collections types and related functions.";
      description = "NOTE: This package is currently NOT MAINTAINED. If you are interested in a class-framework for collections (no implementations of special instances) checkthe package collections-api.\nThis package provides a suite of data structures types, with a consistent API.\nIt is intended as an evolution of the data structures in the @base@ package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        buildable = true;
        };
      };
    }