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
      identifier = { name = "monad-memo"; version = "0.5.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "eduard.sergeev@gmail.com";
      author = "Eduard Sergeev";
      homepage = "https://github.com/EduardSergeev/monad-memo";
      url = "";
      synopsis = "Memoization monad transformer";
      description = "Memoization monad transformer supporting most of the standard monad transformers and a range of memoization cache types: from default pure maps to extremely fast mutable vectors\n\nTo add memoization behaviour to a monadic function:\n\n1) Add 'Control.Monad.Memo.memo' combinator at the point when memoization is required (i.e. recursive call)\n\n>import Control.Monad.Memo\n>\n>fibm 0 = return 0\n>fibm 1 = return 1\n>fibm n = do\n>  n1 <- memo fibm (n-1)\n>  n2 <- memo fibm (n-2)\n>  return (n1+n2)\n\n2) Use appropriate /*eval*/ or /*run*/ function to evaluate resulting `MonadMemo` monad:\n\n>startEvalMemo (fibm 100)\n\nSee detailed description and examples: \"Control.Monad.Memo\"";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.10") (hsPkgs."transformers-compat" or (errorHandler.buildDepError "transformers-compat"));
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."monad-memo" or (errorHandler.buildDepError "monad-memo"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.10") (hsPkgs."transformers-compat" or (errorHandler.buildDepError "transformers-compat"));
          buildable = true;
          };
        };
      benchmarks = {
        "all" = {
          depends = [
            (hsPkgs."monad-memo" or (errorHandler.buildDepError "monad-memo"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.10") (hsPkgs."transformers-compat" or (errorHandler.buildDepError "transformers-compat"));
          buildable = true;
          };
        };
      };
    }