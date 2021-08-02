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
    flags = { use-text-show = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "http-api-data"; version = "0.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Nickolay Kudasov <nickolay.kudasov@gmail.com>";
      author = "Nickolay Kudasov <nickolay.kudasov@gmail.com>";
      homepage = "http://github.com/fizruk/http-api-data";
      url = "";
      synopsis = "Converting to/from HTTP API data like URL pieces, headers and query parameters.";
      description = "Please see README.md";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."time-locale-compat" or (errorHandler.buildDepError "time-locale-compat"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uri-bytestring" or (errorHandler.buildDepError "uri-bytestring"))
          ] ++ (pkgs.lib).optional (flags.use-text-show) (hsPkgs."text-show" or (errorHandler.buildDepError "text-show"));
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."http-api-data" or (errorHandler.buildDepError "http-api-data"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            ];
          buildable = true;
          };
        };
      };
    }