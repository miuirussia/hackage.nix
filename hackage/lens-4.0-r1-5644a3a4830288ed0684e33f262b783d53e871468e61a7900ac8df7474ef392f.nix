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
      benchmark-uniplate = false;
      inlining = true;
      old-inline-pragmas = false;
      dump-splices = false;
      test-hlint = true;
      test-doctests = true;
      test-hunit = true;
      test-properties = true;
      safe = false;
      trustworthy = true;
      lib-werror = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "lens"; version = "4.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2012-2014 Edward A. Kmett";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett";
      homepage = "http://github.com/ekmett/lens/";
      url = "";
      synopsis = "Lenses, Folds and Traversals";
      description = "This package comes \\\"Batteries Included\\\" with many useful lenses for the types\ncommonly used from the Haskell Platform, and with tools for automatically\ngenerating lenses and isomorphisms for user-supplied data types.\n\nThe combinators in @Control.Lens@ provide a highly generic toolbox for composing\nfamilies of getters, folds, isomorphisms, traversals, setters and lenses and their\nindexed variants.\n\nAn overview, with a large number of examples can be found in the <https://github.com/ekmett/lens#lens-lenses-folds-and-traversals README>.\n\nAn introductory video on the style of code used in this library by Simon Peyton Jones is available from <http://skillsmatter.com/podcast/scala/lenses-compositional-data-access-and-manipulation Skills Matter>.\n\nA video on how to use lenses and how they are constructed is available on <http://youtu.be/cefnmjtAolY?hd=1 youtube>.\n\nSlides for that second talk can be obtained from <http://comonad.com/haskell/Lenses-Folds-and-Traversals-NYC.pdf comonad.com>.\n\nMore information on the care and feeding of lenses, including a brief tutorial and motivation\nfor their types can be found on the <https://github.com/ekmett/lens/wiki lens wiki>.\n\nA small game of @pong@ and other more complex examples that manage their state using lenses can be found in the <https://github.com/ekmett/lens/blob/master/examples/ example folder>.\n\n/Lenses, Folds and Traversals/\n\nWith some signatures simplified, the core of the hierarchy of lens-like constructions looks like:\n\n\n<<http://i.imgur.com/4fHw3Fd.png>>\n\n<Hierarchy.png (Local Copy)>\n\nYou can compose any two elements of the hierarchy above using @(.)@ from the @Prelude@, and you can\nuse any element of the hierarchy as any type it linked to above it.\n\nThe result is their lowest upper bound in the hierarchy (or an error if that bound doesn't exist).\n\nFor instance:\n\n* You can use any 'Traversal' as a 'Fold' or as a 'Setter'.\n\n* The composition of a 'Traversal' and a 'Getter' yields a 'Fold'.\n\n/Minimizing Dependencies/\n\nIf you want to provide lenses and traversals for your own types in your own libraries, then you\ncan do so without incurring a dependency on this (or any other) lens package at all.\n\n/e.g./ for a data type:\n\n> data Foo a = Foo Int Int a\n\nYou can define lenses such as\n\n> -- bar :: Lens' (Foo a) Int\n> bar :: Functor f => (Int -> f Int) -> Foo a -> f (Foo a)\n> bar f (Foo a b c) = fmap (\\a' -> Foo a' b c) (f a)\n\n> -- baz :: Lens (Foo a) (Foo b) a b\n> quux :: Functor f => (a -> f b) -> Foo a -> f (Foo b)\n> quux f (Foo a b c) = fmap (Foo a b) (f c)\n\nwithout the need to use any type that isn't already defined in the @Prelude@.\n\nAnd you can define a traversal of multiple fields with 'Control.Applicative.Applicative':\n\n> -- traverseBarAndBaz :: Traversal' (Foo a) Int\n> traverseBarAndBaz :: Applicative f => (Int -> f Int) -> Foo a -> f (Foo a)\n> traverseBarAndBaz f (Foo a b c) = Foo <\$> f a <*> f b <*> pure c\n\nWhat is provided in this library is a number of stock lenses and traversals for\ncommon haskell types, a wide array of combinators for working them, and more\nexotic functionality, (/e.g./ getters, setters, indexed folds, isomorphisms).";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."constraints" or (errorHandler.buildDepError "constraints"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."reflection" or (errorHandler.buildDepError "reflection"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."transformers-compat" or (errorHandler.buildDepError "transformers-compat"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."void" or (errorHandler.buildDepError "void"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          ];
        buildable = true;
        };
      tests = {
        "templates" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            ];
          buildable = true;
          };
        "properties" = {
          depends = (pkgs.lib).optionals (!(!flags.test-properties)) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-th" or (errorHandler.buildDepError "test-framework-th"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            ];
          buildable = if !flags.test-properties then false else true;
          };
        "hunit" = {
          depends = (pkgs.lib).optionals (!(!flags.test-hunit)) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-th" or (errorHandler.buildDepError "test-framework-th"))
            ];
          buildable = if !flags.test-hunit then false else true;
          };
        "doctests" = {
          depends = (pkgs.lib).optionals (!(!flags.test-doctests)) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."nats" or (errorHandler.buildDepError "nats"))
            (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
            (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
            (hsPkgs."simple-reflect" or (errorHandler.buildDepError "simple-reflect"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            ];
          buildable = if !flags.test-doctests then false else true;
          };
        "hlint" = {
          depends = (pkgs.lib).optionals (!(!flags.test-hlint)) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hlint" or (errorHandler.buildDepError "hlint"))
            ];
          buildable = if !flags.test-hlint then false else true;
          };
        };
      benchmarks = {
        "plated" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            ] ++ (pkgs.lib).optional (flags.benchmark-uniplate) (hsPkgs."uniplate" or (errorHandler.buildDepError "uniplate"));
          buildable = true;
          };
        "alongside" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."comonads-fd" or (errorHandler.buildDepError "comonads-fd"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            ];
          buildable = true;
          };
        "unsafe" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."comonads-fd" or (errorHandler.buildDepError "comonads-fd"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            ];
          buildable = true;
          };
        "zipper" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."comonads-fd" or (errorHandler.buildDepError "comonads-fd"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }