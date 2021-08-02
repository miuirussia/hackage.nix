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
    flags = { binary = false; };
    package = {
      specVersion = "1.10";
      identifier = {
        name = "relational-record-examples";
        version = "0.3.0.0";
        };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Shohei Murayama <shohei.murayama@gmail.com>";
      author = "Kazu Yamamoto <kazu@iij.ad.jp>\nShohei Murayama <shohei.murayama@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Examples of Haskell Relationa Record";
      description = "Provides examples of Haskell Relational Record";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."HDBC" or (errorHandler.buildDepError "HDBC"))
          (hsPkgs."HDBC-session" or (errorHandler.buildDepError "HDBC-session"))
          (hsPkgs."HDBC-sqlite3" or (errorHandler.buildDepError "HDBC-sqlite3"))
          (hsPkgs."persistable-record" or (errorHandler.buildDepError "persistable-record"))
          (hsPkgs."relational-query" or (errorHandler.buildDepError "relational-query"))
          (hsPkgs."relational-query-HDBC" or (errorHandler.buildDepError "relational-query-HDBC"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      exes = {
        "examples" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."relational-query" or (errorHandler.buildDepError "relational-query"))
            (hsPkgs."relational-record-examples" or (errorHandler.buildDepError "relational-record-examples"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            ];
          buildable = if flags.binary then true else false;
          };
        };
      };
    }