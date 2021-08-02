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
      specVersion = "1.6";
      identifier = { name = "BiobaseXNA"; version = "0.7.0.2"; };
      license = "GPL-3.0-only";
      copyright = "Christian Hoener zu Siederdissen, 2011-2013";
      maintainer = "choener@tbi.univie.ac.at";
      author = "Christian Hoener zu Siederdissen";
      homepage = "http://www.tbi.univie.ac.at/~choener/";
      url = "";
      synopsis = "Efficient RNA/DNA representations";
      description = "This is a base library for bioinformatics with emphasis on RNA\nand DNA primary structure.\n\nProvided are efficient encodings for short sequences, as\nrequired by RNA folding tools. Extended RNA secondary\nstructures can be represented as well.\n\n\n\nContains data from:\n\nFrequency and isostericity of RNA base pairs\n\nJesse Stombaugh, Craig L. Zirbel, Eric Westhof, and Neocles B. Leontis\n\nNucl. Acids Res. (2009)\n\n<http://dx.crossref.org/10.1093%2Fnar%2Fgkp011>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."csv" or (errorHandler.buildDepError "csv"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."PrimitiveArray" or (errorHandler.buildDepError "PrimitiveArray"))
          (hsPkgs."repa" or (errorHandler.buildDepError "repa"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."tuple" or (errorHandler.buildDepError "tuple"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "SubOptDistance" = {
          depends = [
            (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
            ];
          buildable = true;
          };
        };
      };
    }