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
      identifier = { name = "base-orphans"; version = "0.8.3"; };
      license = "MIT";
      copyright = "(c) 2012-2017 Simon Hengel,\n(c) 2014-2017 João Cristóvão,\n(c) 2015-2017 Ryan Scott";
      maintainer = "Simon Hengel <sol@typeful.net>,\nJoão Cristóvão <jmacristovao@gmail.com>,\nRyan Scott <ryan.gl.scott@gmail.com>";
      author = "Simon Hengel <sol@typeful.net>,\nJoão Cristóvão <jmacristovao@gmail.com>,\nRyan Scott <ryan.gl.scott@gmail.com>";
      homepage = "https://github.com/haskell-compat/base-orphans#readme";
      url = "";
      synopsis = "Backwards-compatible orphan instances for base";
      description = "@base-orphans@ defines orphan instances that mimic instances available in\nlater versions of @base@ to a wider (older) range of compilers.\n@base-orphans@ does not export anything except the orphan instances\nthemselves and complements @<http://hackage.haskell.org/package/base-compat\nbase-compat>@.\n\nSee the README for what instances are covered:\n<https://github.com/haskell-compat/base-orphans#readme>.\nSee also the\n<https://github.com/haskell-compat/base-orphans#what-is-not-covered what is not covered>\nsection.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base-orphans" or (errorHandler.buildDepError "base-orphans"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover.components.exes.hspec-discover or (pkgs.buildPackages.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
            ];
          buildable = true;
          };
        };
      };
    }