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
      specVersion = "1.4";
      identifier = { name = "bindings-bfd"; version = "1.0.0"; };
      license = "LGPL-3.0-only";
      copyright = "(c) 2009,2010,2011 Mick Nelso";
      maintainer = "mcnster@gmail.com";
      author = "Mick Nelso";
      homepage = "http://projects.haskell.org/bindings-bfd/";
      url = "darcs://code.haskell.org/bindings-bfd";
      synopsis = "Bindings for libbfd, a library of the GNU `binutils'";
      description = "These are bindings for `libbfd', a library of the GNU\n`binutils' package.  The bindings let a Haskell program\nquery the structure of any executable, object, or\nlibrary file format supported by the GNU Project (alot).\nIt also has support for disassembly of code in these\nfiles where available.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
        libs = [
          (pkgs."bfd" or (errorHandler.sysDepError "bfd"))
          (pkgs."opcodes" or (errorHandler.sysDepError "opcodes"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.alex.components.exes.alex or (pkgs.buildPackages.alex or (errorHandler.buildToolDepError "alex:alex")))
          (hsPkgs.buildPackages.happy.components.exes.happy or (pkgs.buildPackages.happy or (errorHandler.buildToolDepError "happy:happy")))
          (hsPkgs.buildPackages.hsc2hs.components.exes.hsc2hs or (pkgs.buildPackages.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
          ];
        buildable = true;
        };
      };
    }