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
      identifier = { name = "linearmap-category"; version = "0.4.1.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "(@) jsag \$ hvl.no";
      author = "Justus Sagemüller";
      homepage = "https://github.com/leftaroundabout/linearmap-family";
      url = "";
      synopsis = "Native, complete, matrix-free linear algebra.";
      description = "The term /numerical linear algebra/ is often used almost\nsynonymous with /matrix modifications/. However, what's interesting\nfor most applications are really just /points in some vector space/\nand linear mappings between them, not matrices (which represent\npoints or mappings, but inherently depend on a particular choice\nof basis / coordinate system).\n\nThis library implements the crucial LA operations like solving\nlinear equations and eigenvalue problems, without requiring\nthat the vectors are represented in some particular basis. Apart\nfrom conceptual elegance (only operations that are actually\ngeometrically sensible will typecheck – this is far stronger than\njust confirming that the dimensions match, as some other libraries\ndo), this also opens up good optimisation possibilities: the\nvectors can be unboxed, use dedicated sparse compression, possibly\ncarry out the computations on accelerated hardware (GPU etc.).\nThe spaces can even be infinite-dimensional (e.g. function spaces).\n\nThe linear algebra algorithms in this package only require the\nvectors to support fundamental operations like addition, scalar\nproducts, double-dual-space coercion and tensor products; none of\nthis requires a basis representation.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."vector-space" or (errorHandler.buildDepError "vector-space"))
          (hsPkgs."MemoTrie" or (errorHandler.buildDepError "MemoTrie"))
          (hsPkgs."constrained-categories" or (errorHandler.buildDepError "constrained-categories"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."free-vector-spaces" or (errorHandler.buildDepError "free-vector-spaces"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."manifolds-core" or (errorHandler.buildDepError "manifolds-core"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
          (hsPkgs."ieee754" or (errorHandler.buildDepError "ieee754"))
          (hsPkgs."call-stack" or (errorHandler.buildDepError "call-stack"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
        buildable = true;
        };
      tests = {
        "tasty" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."linearmap-category" or (errorHandler.buildDepError "linearmap-category"))
            (hsPkgs."vector-space" or (errorHandler.buildDepError "vector-space"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."manifolds-core" or (errorHandler.buildDepError "manifolds-core"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."constrained-categories" or (errorHandler.buildDepError "constrained-categories"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        };
      };
    }