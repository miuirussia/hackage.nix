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
      specVersion = "1.8";
      identifier = { name = "flaccuraterip"; version = "0.1"; };
      license = "GPL-3.0-only";
      copyright = "Copyright © 2012 Nicola Squartini";
      maintainer = "Nicola Squartini <tensor5@gmail.com>";
      author = "Nicola Squartini";
      homepage = "http://noaxiom.org/flAccurateRip";
      url = "";
      synopsis = "Verify FLAC files ripped form CD using AccurateRip™";
      description = "/flAccurateRip/ is a command line tool to verify the accuracy of FLAC\nfiles ripped form CD, using the information contained in the\nAccurateRip™ database about other rips of the same CD.\n\nTo use it, open a shell and run\n\n>>> cd DIR_CONTAINING_RIPPED_FLAC_FILES\n>>> flaccuraterip *.flac\n\nNotice: to work correctly, *.flac should expand to the list of flac\nfiles corresponding to the tracks of the CD you want to verify, and\nin the same order as they appear on the CD.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "flaccuraterip" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            ];
          buildable = true;
          };
        };
      };
    }