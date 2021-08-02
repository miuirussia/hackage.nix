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
      identifier = { name = "persistent-vector"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "travitch@cs.wisc.edu";
      author = "Tristan Ravitch";
      homepage = "";
      url = "";
      synopsis = "A persistent sequence based on array mapped tries";
      description = "This package provides persistent vectors based on array mapped\ntries.  The implementation is based on the persistent vectors used\nin clojure, but in a Haskell-style API.  The API is modeled after\nData.Sequence from the containers library.\n\nTechnically, the element-wise operations are O(log(n)), but the\nunderlying tree cannot be more than 7 or 8 levels deep so this is\neffectively constant time.\n\nOne change from the clojure implementation is that this version supports\nO(1) slicing, though it does cheat a little.  Slices retain references\nto elements that cannot be indexed.  These extra references (and the space\nthey occupy) can be reclaimed by 'shrink'ing the slice.  This seems like\na reasonable tradeoff, and, I believe, mirrors the behavior of the vector\nlibrary.\n\nHighlights:\n\n* O(1) append element, indexing, updates, length, and slicing\n\n* Reasonably compact representation";
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
      tests = {
        "pvTests" = {
          depends = [
            (hsPkgs."persistent-vector" or (errorHandler.buildDepError "persistent-vector"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "pvBench" = {
          depends = [
            (hsPkgs."persistent-vector" or (errorHandler.buildDepError "persistent-vector"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            ];
          buildable = true;
          };
        };
      };
    }