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
      identifier = { name = "antisplice"; version = "0.17.1.0"; };
      license = "AGPL-3.0-only";
      copyright = "";
      maintainer = "marvin.cohrs@gmx.net";
      author = "Marvin Cohrs";
      homepage = "http://doomanddarkness.eu/pub/antisplice";
      url = "";
      synopsis = "An engine for text-based dungeons.";
      description = "An engine for text-based dungeons.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."chatty" or (errorHandler.buildDepError "chatty"))
          (hsPkgs."chatty-utils" or (errorHandler.buildDepError "chatty-utils"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."haskeline" or (errorHandler.buildDepError "haskeline"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
        buildable = true;
        };
      };
    }