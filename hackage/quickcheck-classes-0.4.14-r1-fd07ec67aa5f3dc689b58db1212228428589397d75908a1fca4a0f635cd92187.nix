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
    flags = { aeson = true; semigroupoids = true; semirings = true; };
    package = {
      specVersion = "1.10";
      identifier = { name = "quickcheck-classes"; version = "0.4.14"; };
      license = "BSD-3-Clause";
      copyright = "2018 Andrew Martin";
      maintainer = "andrew.thaddeus@gmail.com";
      author = "Andrew Martin, chessai";
      homepage = "https://github.com/andrewthad/quickcheck-classes#readme";
      url = "";
      synopsis = "QuickCheck common typeclasses";
      description = "This library provides QuickCheck properties to ensure\nthat typeclass instances adhere to the set of laws that\nthey are supposed to. There are other libraries that do\nsimilar things, such as `genvalidity-hspec` and `checkers`.\nThis library differs from other solutions by not introducing\nany new typeclasses that the user needs to learn.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          ] ++ (pkgs.lib).optional (flags.aeson) (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))) ++ (pkgs.lib).optional (flags.semigroupoids) (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))) ++ (pkgs.lib).optional (flags.semirings) (hsPkgs."semirings" or (errorHandler.buildDepError "semirings"));
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."quickcheck-classes" or (errorHandler.buildDepError "quickcheck-classes"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
            ] ++ (pkgs.lib).optional (flags.aeson) (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"));
          buildable = true;
          };
        };
      };
    }