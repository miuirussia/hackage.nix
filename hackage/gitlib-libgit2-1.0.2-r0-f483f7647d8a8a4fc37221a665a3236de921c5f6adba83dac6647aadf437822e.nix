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
      identifier = { name = "gitlib-libgit2"; version = "1.0.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "johnw@fpcomplete.com";
      author = "John Wiegley";
      homepage = "";
      url = "";
      synopsis = "Libgit2 backend for gitlib";
      description = "Libgit2  (<http://libgit2.github.com>) backend for @gitlib@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."gitlib" or (errorHandler.buildDepError "gitlib"))
          (hsPkgs."gitlib-utils" or (errorHandler.buildDepError "gitlib-utils"))
          (hsPkgs."hlibgit2" or (errorHandler.buildDepError "hlibgit2"))
          (hsPkgs."attempt" or (errorHandler.buildDepError "attempt"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."failure" or (errorHandler.buildDepError "failure"))
          (hsPkgs."hex" or (errorHandler.buildDepError "hex"))
          (hsPkgs."lifted-base" or (errorHandler.buildDepError "lifted-base"))
          (hsPkgs."missing-foreign" or (errorHandler.buildDepError "missing-foreign"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
          (hsPkgs."parallel-io" or (errorHandler.buildDepError "parallel-io"))
          (hsPkgs."pointless-fun" or (errorHandler.buildDepError "pointless-fun"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."system-fileio" or (errorHandler.buildDepError "system-fileio"))
          (hsPkgs."system-filepath" or (errorHandler.buildDepError "system-filepath"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-icu" or (errorHandler.buildDepError "text-icu"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "smoke" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gitlib" or (errorHandler.buildDepError "gitlib"))
            (hsPkgs."gitlib-test" or (errorHandler.buildDepError "gitlib-test"))
            (hsPkgs."gitlib-libgit2" or (errorHandler.buildDepError "gitlib-libgit2"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-expectations" or (errorHandler.buildDepError "hspec-expectations"))
            ];
          buildable = true;
          };
        };
      };
    }