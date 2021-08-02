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
    flags = {
      semigroup-in-base = true;
      enable-hedgehog = true;
      enable-doctest = true;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "partial-semigroup"; version = "0.5.1.6"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Chris Martin <ch.martin@gmail.com>";
      author = "Chris Martin <ch.martin@gmail.com>";
      homepage = "https://github.com/chris-martin/partial-semigroup";
      url = "";
      synopsis = "A partial binary associative operator";
      description = "A partial semigroup is like a semigroup, but the operator\nis partial. We represent this in Haskell as a total function\n@(<>?) :: a -> a -> Maybe a@.\n\nThe\n<https://hackage.haskell.org/package/partial-semigroup-hedgehog partial-semigroup-hedgehog>\ncompanion package provides support for checking the partial\nsemigroup associativity axiom using the\n<https://hackage.haskell.org/package/hedgehog hedgehog>\npackage.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ (if flags.semigroup-in-base
          then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
          else [
            (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
            ]);
        buildable = true;
        };
      tests = {
        "docs" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            ] ++ (pkgs.lib).optionals (flags.enable-doctest) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            ]) ++ (if flags.semigroup-in-base
            then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
            else [
              (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
              ]);
          buildable = true;
          };
        "examples" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."partial-semigroup" or (errorHandler.buildDepError "partial-semigroup"))
            ] ++ (pkgs.lib).optional (flags.enable-hedgehog) (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))) ++ (if flags.semigroup-in-base
            then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
            else [
              (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
              ]);
          buildable = true;
          };
        "properties" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."partial-semigroup" or (errorHandler.buildDepError "partial-semigroup"))
            ] ++ (pkgs.lib).optional (flags.enable-hedgehog) (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))) ++ (if flags.semigroup-in-base
            then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
            else [
              (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
              ]);
          buildable = true;
          };
        "generics" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."partial-semigroup" or (errorHandler.buildDepError "partial-semigroup"))
            ] ++ (pkgs.lib).optional (flags.enable-hedgehog) (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))) ++ (if flags.semigroup-in-base
            then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
            else [
              (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
              ]);
          buildable = true;
          };
        };
      };
    }