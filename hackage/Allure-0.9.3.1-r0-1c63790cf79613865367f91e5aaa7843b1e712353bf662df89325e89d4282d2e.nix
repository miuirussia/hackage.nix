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
    flags = { supportnodejs = true; };
    package = {
      specVersion = "2.2";
      identifier = { name = "Allure"; version = "0.9.3.1"; };
      license = "AGPL-3.0-or-later";
      copyright = "";
      maintainer = "Mikolaj Konarski <mikolaj.konarski@funktory.com>";
      author = "Andres Loeh, Mikolaj Konarski and others";
      homepage = "http://allureofthestars.com";
      url = "";
      synopsis = "Near-future Sci-Fi roguelike and tactical squad combat game";
      description = "Allure of the Stars is a near-future Sci-Fi roguelike\nand tactical squad combat game. Binaries and the game manual\nare available at the homepage, where you can also\ntry the game out in the browser:\n<http://allureofthestars.com/play>.\n(It runs fastest on Chrome. Keyboard commands and savefiles\nare supported only on recent enough versions of browsers.\nMouse should work everywhere.)\n\nNot a single picture in this game. You have to imagine everything\nyourself, like with a book (a grown-up book, without pictures).\nOnce you learn to imagine things, though, you can keep exploring\nand mastering the world and making up stories for a long time.\n\nThe game is written in Haskell using the LambdaHack roguelike\ngame engine <http://hackage.haskell.org/package/LambdaHack>.\nPlease see the changelog file for recent improvements\nand the issue tracker for short-term plans. Long term goals\nare high replayability and auto-balancing through procedural\ncontent generation and persistent content modification\nbased on player behaviour. Contributions are welcome.\n\nThis is a workaround .cabal file, flattened to eliminated\ninternal libraries until generating haddocks for them\nis fixed. The original .cabal file is stored in the github repo.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."LambdaHack" or (errorHandler.buildDepError "LambdaHack"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."enummapset" or (errorHandler.buildDepError "enummapset"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."ghc-compact" or (errorHandler.buildDepError "ghc-compact"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      exes = {
        "Allure" = {
          depends = [
            (hsPkgs."LambdaHack" or (errorHandler.buildDepError "LambdaHack"))
            (hsPkgs."Allure" or (errorHandler.buildDepError "Allure"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."LambdaHack" or (errorHandler.buildDepError "LambdaHack"))
            (hsPkgs."Allure" or (errorHandler.buildDepError "Allure"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            ];
          buildable = true;
          };
        };
      };
    }