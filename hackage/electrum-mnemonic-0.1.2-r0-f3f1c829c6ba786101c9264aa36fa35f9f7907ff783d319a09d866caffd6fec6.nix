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
      specVersion = "1.8";
      identifier = { name = "electrum-mnemonic"; version = "0.1.2"; };
      license = "GPL-3.0-only";
      copyright = "2014 Joey Hess\n2011 thomasv";
      maintainer = "Joey Hess <joey@kitenet.net>";
      author = "Joey Hess";
      homepage = "";
      url = "";
      synopsis = "easy to remember mnemonic for a high-entropy value";
      description = "A compatible re-implementation of the mnemonic used by the\nElectrum bitcoin wallet.\n\nGenerates an easy to remember mnemonic phrase from a high entropy value\nsuch as a private key. Three words are sufficient to encode 128 bits\nof data.\n\nThe word list is tuned to produce memorable and often poetic\nphrases, for example:\n- dragon image everywhere teeth cage universe\n- respect born enemy affection sometimes human\n- certain return beauty baby great art";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."electrum-mnemonic" or (errorHandler.buildDepError "electrum-mnemonic"))
            ];
          buildable = true;
          };
        };
      };
    }