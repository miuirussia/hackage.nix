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
    flags = { usecdar = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "aern2-mp"; version = "0.1.3.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2015-2018 Michal Konecny";
      maintainer = "Michal Konecny <mikkonecny@gmail.com>";
      author = "Michal Konecny";
      homepage = "https://github.com/michalkonecny/aern2";
      url = "";
      synopsis = "Multi-precision floats via rounded (MPFR)";
      description = "Arbitrary-precision dyadic numbers and safely-rounded interval arithmetic:\n\n* Dyadic:  variable-precision floats with exact ring operations\n\n* MPBall: float ± error bound with field & elementary (interval-like) operations\n\nThere is a plan to add an Integer-only backend so that aern2-mp can\nbe used without MPFR.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."integer-logarithms" or (errorHandler.buildDepError "integer-logarithms"))
          (hsPkgs."convertible" or (errorHandler.buildDepError "convertible"))
          (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
          (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."mixed-types-num" or (errorHandler.buildDepError "mixed-types-num"))
          ] ++ (pkgs.lib).optional (!flags.usecdar) (hsPkgs."rounded" or (errorHandler.buildDepError "rounded"));
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aern2-mp" or (errorHandler.buildDepError "aern2-mp"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }