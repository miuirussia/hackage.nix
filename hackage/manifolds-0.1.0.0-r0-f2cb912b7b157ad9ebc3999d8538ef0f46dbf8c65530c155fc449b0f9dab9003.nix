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
      identifier = { name = "manifolds"; version = "0.1.0.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "(@) sagemueller \$ geo.uni-koeln.de";
      author = "Justus Sagemüller";
      homepage = "";
      url = "";
      synopsis = "Working with manifolds in a direct, embedding-free way.";
      description = "Manifolds, a generalisation of the notion of \\\"smooth curves\\\" or sufaces,\nare topological spaces /locally homeomorphic to a vector space/. This gives\nrise to what is actually the most natural / mathematically elegant way of dealing\nwith them: calculations can be carried out locally, in connection with Riemannian\nproducts etc., in a vector space, the tangent space / tangent bundle.\n\nHowever, this does not trivially translate to non-local operations. Common\nways to carry those out include using a single affine map to cover (almost) all of the manifold\n(in general not possible homeomorphically, which leads to both topological and geometrical\nproblems), to embed the manifold into a larger-dimensional vector space (which tends\nto distract from the manifold's own properties and is often not friendly to computations)\nor approximating the manifold by some kind of finite simplicial mesh (which intrinsically\nintroduces non-differentiability issues and leads to the question of what precision\nis required).\n\nThis library tries to mitigate these problems by using Haskell's\nfunctional nature to keep the representation close to the mathematical ideal of\nlocal linearity with homeomorphic coordinate transforms, and, where it is\nnecessary to recede to the less elegant alternatives, exploiting lazy evaluation\netc. to optimise the compromises that have to be made.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."vector-space" or (errorHandler.buildDepError "vector-space"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."vector-algorithms" or (errorHandler.buildDepError "vector-algorithms"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."MonadRandom" or (errorHandler.buildDepError "MonadRandom"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."void" or (errorHandler.buildDepError "void"))
          (hsPkgs."constrained-categories" or (errorHandler.buildDepError "constrained-categories"))
          ];
        buildable = true;
        };
      };
    }