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
      identifier = { name = "short-vec"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "2018-2021 Google LLC";
      maintainer = "Andrew Pritchard <awpr@google.com>";
      author = "Lennart Augustsson <lennart@augustsson.net>, Wren Romano, Andrew Pritchard <awpr@google.com>";
      homepage = "https://github.com/google/hs-fin-vec#readme";
      url = "";
      synopsis = "A length-indexed vector type build on 'SmallArray#'";
      description = "This provides performant length-indexed vectors with a suite of rewrite rules\nimplementing fusion of intermediate structures, so that expressions involving\nmany operations can usually be compiled to a single pass of computing and\nwriting each index of the final 'Vec'.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."adjunctions" or (errorHandler.buildDepError "adjunctions"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
          (hsPkgs."fin-int" or (errorHandler.buildDepError "fin-int"))
          (hsPkgs."indexed-traversable" or (errorHandler.buildDepError "indexed-traversable"))
          (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
          (hsPkgs."portray" or (errorHandler.buildDepError "portray"))
          (hsPkgs."portray-diff" or (errorHandler.buildDepError "portray-diff"))
          (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
          (hsPkgs."sint" or (errorHandler.buildDepError "sint"))
          ];
        buildable = true;
        };
      tests = {
        "Vec-test" = {
          depends = [
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."adjunctions" or (errorHandler.buildDepError "adjunctions"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
            (hsPkgs."fin-int" or (errorHandler.buildDepError "fin-int"))
            (hsPkgs."indexed-traversable" or (errorHandler.buildDepError "indexed-traversable"))
            (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
            (hsPkgs."portray" or (errorHandler.buildDepError "portray"))
            (hsPkgs."portray-diff" or (errorHandler.buildDepError "portray-diff"))
            (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
            (hsPkgs."short-vec" or (errorHandler.buildDepError "short-vec"))
            (hsPkgs."sint" or (errorHandler.buildDepError "sint"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "Vec-benchmark" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."adjunctions" or (errorHandler.buildDepError "adjunctions"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
            (hsPkgs."fin-int" or (errorHandler.buildDepError "fin-int"))
            (hsPkgs."gauge" or (errorHandler.buildDepError "gauge"))
            (hsPkgs."indexed-traversable" or (errorHandler.buildDepError "indexed-traversable"))
            (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
            (hsPkgs."portray" or (errorHandler.buildDepError "portray"))
            (hsPkgs."portray-diff" or (errorHandler.buildDepError "portray-diff"))
            (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
            (hsPkgs."short-vec" or (errorHandler.buildDepError "short-vec"))
            (hsPkgs."sint" or (errorHandler.buildDepError "sint"))
            ];
          buildable = true;
          };
        };
      };
    }