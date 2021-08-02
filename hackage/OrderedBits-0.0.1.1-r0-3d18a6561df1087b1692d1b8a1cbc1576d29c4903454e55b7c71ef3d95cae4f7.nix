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
      identifier = { name = "OrderedBits"; version = "0.0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "Christian Hoener zu Siederdissen, 2014 - 2016";
      maintainer = "choener@bioinf.uni-leipzig.de";
      author = "Christian Hoener zu Siederdissen";
      homepage = "https://github.com/choener/OrderedBits";
      url = "";
      synopsis = "Efficient ordered (by popcount) enumeration of bits";
      description = "This library provides efficient methods to enumerate all\nelements of a set in order of the population count, or the\nordered enumerations of the elements of the powerset of a set.\nFirst, the empty set, then all 1-element sets, all 2-element\nsets, etc.  Such enumerations are important for algorithms over\nunordered data sets. Examples include the travelling salesman\nproblem and the closely related Hamiltonian path problem.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bits" or (errorHandler.buildDepError "bits"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."vector-algorithms" or (errorHandler.buildDepError "vector-algorithms"))
          ];
        buildable = true;
        };
      tests = {
        "properties" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."OrderedBits" or (errorHandler.buildDepError "OrderedBits"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (errorHandler.buildDepError "tasty-th"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."OrderedBits" or (errorHandler.buildDepError "OrderedBits"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }