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
    flags = { cross = false; low-memory = false; system-libarchive = true; };
    package = {
      specVersion = "3.0";
      identifier = { name = "libarchive"; version = "3.0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2018-2020 Vanessa McHale";
      maintainer = "vamchale@gmail.com";
      author = "Vanessa McHale";
      homepage = "";
      url = "";
      synopsis = "Haskell interface to libarchive";
      description = "Haskell bindings for [libarchive](https://www.libarchive.org/). Provides the ability to unpack archives, including the ability to unpack archives lazily.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (errorHandler.setupDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.buildPackages.chs-cabal or (pkgs.buildPackages.chs-cabal or (errorHandler.setupDepError "chs-cabal")))
        ];
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."composition-prelude" or (errorHandler.buildDepError "composition-prelude"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."unix-compat" or (errorHandler.buildDepError "unix-compat"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ] ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "8.0")) [
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ]) ++ (pkgs.lib).optionals (!flags.system-libarchive) ((pkgs.lib).optionals (!system.isOsx) ((pkgs.lib).optionals (!system.isLinux) ((pkgs.lib).optional (!system.isFreebsd) (hsPkgs."unbuildable" or (errorHandler.buildDepError "unbuildable")))));
        pkgconfig = (pkgs.lib).optional (!(!flags.system-libarchive)) (pkgconfPkgs."libarchive" or (errorHandler.pkgConfDepError "libarchive"));
        build-tools = (pkgs.lib).optional (!flags.cross) (hsPkgs.buildPackages.c2hs.components.exes.c2hs or (pkgs.buildPackages.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")));
        buildable = if !flags.system-libarchive
          then if system.isOsx
            then true
            else if system.isLinux
              then true
              else if system.isFreebsd then true else false
          else true;
        };
      tests = {
        "libarchive-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."libarchive" or (errorHandler.buildDepError "libarchive"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."dir-traverse" or (errorHandler.buildDepError "dir-traverse"))
            (hsPkgs."composition-prelude" or (errorHandler.buildDepError "composition-prelude"))
            (hsPkgs."pathological-bytestrings" or (errorHandler.buildDepError "pathological-bytestrings"))
            ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"));
          build-tools = [
            (hsPkgs.buildPackages.cpphs.components.exes.cpphs or (pkgs.buildPackages.cpphs or (errorHandler.buildToolDepError "cpphs:cpphs")))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "libarchive-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."libarchive" or (errorHandler.buildDepError "libarchive"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tar" or (errorHandler.buildDepError "tar"))
            (hsPkgs."tar-conduit" or (errorHandler.buildDepError "tar-conduit"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            ];
          buildable = true;
          };
        "mem" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."libarchive" or (errorHandler.buildDepError "libarchive"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }