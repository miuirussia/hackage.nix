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
      specVersion = "1.6";
      identifier = { name = "github"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2011 Mike Burns";
      maintainer = "mike@mike-burns.com";
      author = "Mike Burns";
      homepage = "";
      url = "";
      synopsis = "Access to the Github API, v3.";
      description = "The Github API provides programmatic access to the full\nGithub Web site, from Issues to Gists to repos down to the underlying git data\nlike references and trees. This library wraps all of that, exposing a basic but\nHaskell-friendly set of functions and data structures.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."http-enumerator" or (errorHandler.buildDepError "http-enumerator"))
          (hsPkgs."uri" or (errorHandler.buildDepError "uri"))
          (hsPkgs."failure" or (errorHandler.buildDepError "failure"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      };
    }