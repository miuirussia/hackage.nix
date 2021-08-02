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
    flags = { prim-supports-any = false; };
    package = {
      specVersion = "1.24";
      identifier = { name = "ghc-heap-view"; version = "0.6.0"; };
      license = "BSD-3-Clause";
      copyright = "2012-2019 Joachim Breitner";
      maintainer = "Joachim Breitner <mail@joachim-breitner.de>";
      author = "Joachim Breitner, Dennis Felsing";
      homepage = "";
      url = "";
      synopsis = "Extract the heap representation of Haskell values and thunks";
      description = "This library provides functions to introspect the Haskell heap, for example\nto investigate sharing and lazy evaluation. As this is tied to the internals\nof the compiler, it only works with specific versions. This version supports,\nGHC 8.6. For older GHC versions see ghc-heap-view-0.5.10.\n\nIt has been inspired by (and taken code from) the vacuum package and the GHCi\ndebugger, but also allows to investigate thunks and other closures.\n\nThis package also provides a new GHCi-command, @:printHeap@, which allows you\nto inspect the current heap representation of a value, including sharing and\ncyclic references. To enable the command, you need to load the included ghci\nscript or add it to @~/.ghci@, as explained by @cabal install@. Once it is\nset up, you can do this:\n\n>> let value = \"A Value\"\n>> let x = (value, if head value == 'A' then value else \"\", cycle [True, False])\n>> :printHeap x\n>let x1 = _bco\n>    x21 = []\n>in (x1,_bco,_bco)\n>> length (take 100 (show x)) `seq` return () -- evaluate everything\n>> :printHeap x\n>let x1 = \"A Value\"\n>    x16 = True : False : x16\n>in (x1,x1,x16)\n\nYou can change the maximum recursion depth using @:setPrintHeapDepth@:\n\n>> :setPrintHeapDepth 3\n>> :printHeap x\n>let x1 = C# 'A' : ... : ...\n>in (x1,x1,True : ... : ...)\n\nIf the view is impaired by blackholes (written @_bh@), running\n@System.Mem.performGC@ usually helps.\n\nThe work on this package has been supported by the Deutsche Telekom Stiftung\n(<http://telekom-stiftung.de>).";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (errorHandler.setupDepError "base")))
        (hsPkgs.buildPackages.filepath or (pkgs.buildPackages.filepath or (errorHandler.setupDepError "filepath")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (errorHandler.setupDepError "Cabal")))
        ];
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-heap" or (errorHandler.buildDepError "ghc-heap"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          ];
        buildable = true;
        };
      tests = {
        "Test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghc-heap-view" or (errorHandler.buildDepError "ghc-heap-view"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            ];
          buildable = true;
          };
        };
      };
    }