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
      identifier = { name = "pqueue"; version = "1.3.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Lennart Spitzner <lsp@informatik.uni-kiel.de>\nLouis Wasserman <wasserman.louis@gmail.com>";
      author = "Louis Wasserman";
      homepage = "";
      url = "";
      synopsis = "Reliable, persistent, fast priority queues.";
      description = "A fast, reliable priority queue implementation based on a binomial heap.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ];
        buildable = true;
        };
      };
    }