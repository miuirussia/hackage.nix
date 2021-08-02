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
    flags = { libgmp = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "bitvec"; version = "1.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019-2020 Andrew Lelechenko, 2012-2016 James Cook";
      maintainer = "Andrew Lelechenko <andrew.lelechenko@gmail.com>";
      author = "Andrew Lelechenko <andrew.lelechenko@gmail.com>,\nJames Cook <mokus@deepbondi.net>";
      homepage = "https://github.com/Bodigrim/bitvec";
      url = "";
      synopsis = "Space-efficient bit vectors";
      description = "A newtype over 'Bool' with a better 'Vector' instance: 8x less memory, up to 1000x faster.\n\nThe <https://hackage.haskell.org/package/vector vector>\npackage represents unboxed arrays of 'Bool'\nspending 1 byte (8 bits) per boolean.\nThis library provides a newtype wrapper 'Bit' and a custom instance\nof unboxed 'Vector', which packs bits densely,\nachieving __8x less memory footprint.__\nThe performance stays mostly the same;\nthe most significant degradation happens for random writes\n(up to 10% slower).\nOn the other hand, for certain bulk bit operations\n'Vector' 'Bit' is up to 1000x faster than 'Vector' 'Bool'.\n\n=== Thread safety\n\n* \"Data.Bit\" is faster, but writes and flips are thread-unsafe.\nThis is because naive updates are not atomic:\nread the whole word from memory,\nthen modify a bit, then write the whole word back.\n* \"Data.Bit.ThreadSafe\" is slower (up to 20%),\nbut writes and flips are thread-safe.\n\n=== Similar packages\n\n* <https://hackage.haskell.org/package/bv bv> and\n<https://hackage.haskell.org/package/bv-little bv-little>\ndo not offer mutable vectors.\n\n* <https://hackage.haskell.org/package/array array>\nis memory-efficient for 'Bool', but lacks\na handy 'Vector' interface and is not thread-safe.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ] ++ (if compiler.isGhc && (compiler.version).lt "9.0"
          then [
            (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
            ]
          else [
            (hsPkgs."ghc-bignum" or (errorHandler.buildDepError "ghc-bignum"))
            ]);
        libs = (pkgs.lib).optional (flags.libgmp) (pkgs."gmp" or (errorHandler.sysDepError "gmp"));
        buildable = true;
        };
      tests = {
        "bitvec-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bitvec" or (errorHandler.buildDepError "bitvec"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."quickcheck-classes" or (errorHandler.buildDepError "quickcheck-classes"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            ] ++ (if compiler.isGhc && (compiler.version).lt "9.0"
            then [
              (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
              ]
            else [
              (hsPkgs."ghc-bignum" or (errorHandler.buildDepError "ghc-bignum"))
              ]);
          buildable = true;
          };
        };
      benchmarks = {
        "gauge" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bitvec" or (errorHandler.buildDepError "bitvec"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."gauge" or (errorHandler.buildDepError "gauge"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            ] ++ (if compiler.isGhc && (compiler.version).lt "9.0"
            then [
              (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
              ]
            else [
              (hsPkgs."ghc-bignum" or (errorHandler.buildDepError "ghc-bignum"))
              ]);
          buildable = true;
          };
        };
      };
    }