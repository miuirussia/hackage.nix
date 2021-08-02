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
      identifier = { name = "lol-tests"; version = "0.0.0.1"; };
      license = "GPL-2.0-only";
      copyright = "Eric Crockett, Chris Peikert";
      maintainer = "Eric Crockett <ecrockett0@gmail.com>";
      author = "Eric Crockett <ecrockett0@gmail.com>, Chris Peikert <cpeikert@alum.mit.edu>";
      homepage = "https://github.com/cpeikert/Lol";
      url = "";
      synopsis = "A library for testing <https://hackage.haskell.org/package/lol Λ ∘ λ>.";
      description = "This library contains code to test <https://hackage.haskell.org/package/lol Λ ∘ λ (Lol)>.\nIt is designed so that third-party tensors can be easily tested using the same framework.\nFor examples of how to use this library, see the tests for\n<https://hackage.haskell.org/package/lol-cpp lol-cpp>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."lol" or (errorHandler.buildDepError "lol"))
          (hsPkgs."MonadRandom" or (errorHandler.buildDepError "MonadRandom"))
          (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
          (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
        buildable = true;
        };
      tests = {
        "test-lol" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lol" or (errorHandler.buildDepError "lol"))
            (hsPkgs."lol-tests" or (errorHandler.buildDepError "lol-tests"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            ];
          buildable = true;
          };
        };
      };
    }