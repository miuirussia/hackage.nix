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
      specVersion = "1.12";
      identifier = { name = "markov-realization"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "2019 Alex Loomis";
      maintainer = "atloomis@math.arizona.edu";
      author = "Alex Loomis";
      homepage = "https://github.com/alexloomis/markov";
      url = "";
      synopsis = "Realizations of Markov chains.";
      description = "Please see the README on GitHub at <https://github.com/alexloomis/markov#markov-tutorial>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."configuration-tools" or (errorHandler.buildDepError "configuration-tools"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."discrimination" or (errorHandler.buildDepError "discrimination"))
          (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
          (hsPkgs."MonadRandom" or (errorHandler.buildDepError "MonadRandom"))
          ];
        buildable = true;
        };
      tests = {
        "markov-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."HTF" or (errorHandler.buildDepError "HTF"))
            (hsPkgs."markov-realization" or (errorHandler.buildDepError "markov-realization"))
            ];
          buildable = true;
          };
        };
      };
    }