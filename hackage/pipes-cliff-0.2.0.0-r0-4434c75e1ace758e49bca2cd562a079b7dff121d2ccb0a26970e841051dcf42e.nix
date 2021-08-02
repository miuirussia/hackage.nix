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
    flags = { tests = false; };
    package = {
      specVersion = "1.12";
      identifier = { name = "pipes-cliff"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2015 Omari Norman";
      maintainer = "omari@smileystation.com";
      author = "Omari Norman";
      homepage = "http://www.github.com/massysett/pipes-cliff";
      url = "";
      synopsis = "Streaming to and from subprocesses using Pipes";
      description = "pipes-cliff helps you spawn subprocesses and send data to and\nfrom them with the Pipes library.\nSubprocesses are opened using the\nprocess library, and the processes and handles are properly\ncleaned up even if there are exceptions.\n\nThough this library uses the Pipes library, I have not coordinated\nwith the author of the Pipes library in any way.  Any bugs or design\nflaws are mine and should be reported to\n\n<http://www.github.com/massysett/pipes-cliff/issues>\n\nFor more information, see the README.md file, which is located in the\nsource tarball and at\n\n<https://github.com/massysett/pipes-cliff>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
          (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."pipes-concurrency" or (errorHandler.buildDepError "pipes-concurrency"))
          ];
        buildable = true;
        };
      exes = {
        "numsToLess" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."pipes-concurrency" or (errorHandler.buildDepError "pipes-concurrency"))
            ];
          buildable = if flags.tests then true else false;
          };
        "alphaNumbers" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."pipes-concurrency" or (errorHandler.buildDepError "pipes-concurrency"))
            ];
          buildable = if flags.tests then true else false;
          };
        "limitedAlphaNumbers" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."pipes-concurrency" or (errorHandler.buildDepError "pipes-concurrency"))
            ];
          buildable = if flags.tests then true else false;
          };
        "alphaNumbersByteString" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."pipes-concurrency" or (errorHandler.buildDepError "pipes-concurrency"))
            ];
          buildable = if flags.tests then true else false;
          };
        };
      };
    }