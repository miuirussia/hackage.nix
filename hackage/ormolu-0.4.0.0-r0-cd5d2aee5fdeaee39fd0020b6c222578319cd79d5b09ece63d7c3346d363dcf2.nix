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
    flags = { dev = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "ormolu"; version = "0.4.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Mark Karpov <mark.karpov@tweag.io>";
      author = "";
      homepage = "https://github.com/tweag/ormolu";
      url = "";
      synopsis = "A formatter for Haskell source code";
      description = "A formatter for Haskell source code.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."Diff" or (errorHandler.buildDepError "Diff"))
          (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."ghc-lib-parser" or (errorHandler.buildDepError "ghc-lib-parser"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          ];
        buildable = true;
        };
      exes = {
        "ormolu" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghc-lib-parser" or (errorHandler.buildDepError "ghc-lib-parser"))
            (hsPkgs."gitrev" or (errorHandler.buildDepError "gitrev"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."ormolu" or (errorHandler.buildDepError "ormolu"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."ormolu" or (errorHandler.buildDepError "ormolu"))
            (hsPkgs."path" or (errorHandler.buildDepError "path"))
            (hsPkgs."path-io" or (errorHandler.buildDepError "path-io"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover.components.exes.hspec-discover or (pkgs.buildPackages.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
            ];
          buildable = true;
          };
        };
      };
    }