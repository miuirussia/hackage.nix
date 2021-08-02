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
      identifier = { name = "hashtable-benchmark"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2017 Hongchang Wu";
      maintainer = "wuhc85@gmail.com";
      author = "Hongchang Wu";
      homepage = "https://github.com/hongchangwu/hashtable-benchmark#readme";
      url = "";
      synopsis = "Benchmark of hash table implementations in Haskell";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      exes = {
        "benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."hashtables" or (errorHandler.buildDepError "hashtables"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }