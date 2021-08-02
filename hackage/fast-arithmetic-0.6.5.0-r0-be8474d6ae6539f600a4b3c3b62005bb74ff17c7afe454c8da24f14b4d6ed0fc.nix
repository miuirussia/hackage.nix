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
    flags = { development = false; };
    package = {
      specVersion = "2.0";
      identifier = { name = "fast-arithmetic"; version = "0.6.5.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2018-2020 Vanessa McHale";
      maintainer = "vamchale@gmail.com";
      author = "Vanessa McHale";
      homepage = "";
      url = "";
      synopsis = "Fast functions on integers.";
      description = "Fast functions for number theory and combinatorics with a high level of safety guaranteed by [ATS](http://www.ats-lang.org/).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hgmp" or (errorHandler.buildDepError "hgmp"))
          ];
        buildable = if system.isWindows then false else true;
        };
      sublibs = {
        "pure-haskell" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."combinat" or (errorHandler.buildDepError "combinat"))
            ];
          buildable = true;
          };
        };
      tests = {
        "fast-arithmetic-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."fast-arithmetic" or (errorHandler.buildDepError "fast-arithmetic"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."arithmoi" or (errorHandler.buildDepError "arithmoi"))
            (hsPkgs."combinat" or (errorHandler.buildDepError "combinat"))
            (hsPkgs."fast-arithmetic".components.sublibs.pure-haskell or (errorHandler.buildDepError "fast-arithmetic:pure-haskell"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "fast-arithmetic-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."fast-arithmetic" or (errorHandler.buildDepError "fast-arithmetic"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."arithmoi" or (errorHandler.buildDepError "arithmoi"))
            (hsPkgs."combinat" or (errorHandler.buildDepError "combinat"))
            (hsPkgs."fast-arithmetic".components.sublibs.pure-haskell or (errorHandler.buildDepError "fast-arithmetic:pure-haskell"))
            ];
          buildable = true;
          };
        };
      };
    }