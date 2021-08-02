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
      have-mmap = true;
      have-sse2 = true;
      old-text-format = true;
      old-bytestring = false;
      old-zlib = false;
      old-vector = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "hPDB"; version = "0.99"; };
      license = "BSD-3-Clause";
      copyright = "Copyright by Michal J. Gajda '2009-'2012";
      maintainer = "mjgajda@googlemail.com";
      author = "Michal J. Gajda";
      homepage = "https://github.com/mgajda/hpdb";
      url = "http://hackage.haskell.org/package/hPDB";
      synopsis = "Parser, print and manipulate structures in PDB file format.";
      description = "Protein Data Bank file format is a most popular format for holding biomolecule data.\nThis is a very fast parser (below 7s for the largest entry in PDB - 1HTQ which is over 70MB - as compared with 11s of RASMOL 2.7.5, or 2m15s of BioPython with Python 2.6 interpreter.)\nIt is aimed to not only deliver event-based interface, but also a high-level data structure for manipulating data in spirit of BioPython's PDB parser.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."AC-Vector" or (errorHandler.buildDepError "AC-Vector"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ] ++ (pkgs.lib).optional (flags.have-mmap) (hsPkgs."bytestring-mmap" or (errorHandler.buildDepError "bytestring-mmap"))) ++ [
          (hsPkgs."text-format" or (errorHandler.buildDepError "text-format"))
          ]) ++ [
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ]) ++ [
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ]) ++ [ (hsPkgs."zlib" or (errorHandler.buildDepError "zlib")) ];
        buildable = true;
        };
      };
    }