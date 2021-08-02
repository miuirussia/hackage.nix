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
    flags = { fusion = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "hsbencher"; version = "1.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) Ryan Newton 2013";
      maintainer = "rrnewton@gmail.com";
      author = "Ryan Newton";
      homepage = "";
      url = "";
      synopsis = "Flexible benchmark runner for Haskell and non-Haskell benchmarks.";
      description = "Benchmark frameworks are usually very specific to the\nhost language/environment.  Hence they are usually about as reusable\nas compiler passes (that is, not).\n\nNevertheless, `hsbencher` is an attempt at a reusable benchmark\nframework.  It knows fairly little about what the benchmarks do, and\nis mostly concerned with defining and iterating through\nconfiguration spaces (e.g. varying the number of threads), and\nmanaging the data that results.\n\nBenchmark data is stored in simple text files, and optionally\nuploaded to Google Fusion Tables.\n\n`hsbencher` attempts to stradle the divide between language-specific\nand language-agnostic by having an extensible set of `BuildMethod`s.\nAs shipped, `hsbencher` knows a little about cabal, ghc, and less\nabout Make, but it can be taught more.\n\nThe general philosophy is to have benchmarks follow a simple\nprotocol, for example printing out a line \"SELFTIMED: 3.3s\" if they\nwish to report their own timing.  The focus is on benchmarks that\nrun long enough to run in their own process.  This is typical of\nparallelism benchmarks and different than the fine grained\nbenchmarks that are well supported by \"Criterion\".\n\n\n`hsbencher` is used by creating a script or executable that imports `HSBencher`\nand provides a list of benchmarks, each of which is decorated with its\nparameter space.  Below is a minimal example that creates a two-configuration\nparameter space:\n\n@\nimport HSBencher\nmain = defaultMainWithBechmarks\n.      [ Benchmark \"bench1/bench1.cabal\" [\"1000\"] \$\n.        Or [ Set NoMeaning (RuntimeParam \"+RTS -qa -RTS\")\n.            , Set NoMeaning (RuntimeEnv \"HELLO\" \"yes\") ] ]\n@\n\nThe output would appear as in this gist:\n<https://gist.github.com/rrnewton/5667800>\n\nMore examples can be found here:\n<https://github.com/rrnewton/HSBencher/tree/master/example>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."hydra-print" or (errorHandler.buildDepError "hydra-print"))
          (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
          (hsPkgs."GenericPretty" or (errorHandler.buildDepError "GenericPretty"))
          ] ++ (pkgs.lib).optional (flags.fusion) (hsPkgs."handa-gdata" or (errorHandler.buildDepError "handa-gdata"));
        buildable = true;
        };
      tests = {
        "test1" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."hydra-print" or (errorHandler.buildDepError "hydra-print"))
            (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
            (hsPkgs."GenericPretty" or (errorHandler.buildDepError "GenericPretty"))
            (hsPkgs."hsbencher" or (errorHandler.buildDepError "hsbencher"))
            ];
          buildable = true;
          };
        "test2" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."hydra-print" or (errorHandler.buildDepError "hydra-print"))
            (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
            (hsPkgs."GenericPretty" or (errorHandler.buildDepError "GenericPretty"))
            (hsPkgs."hsbencher" or (errorHandler.buildDepError "hsbencher"))
            ];
          buildable = true;
          };
        };
      };
    }