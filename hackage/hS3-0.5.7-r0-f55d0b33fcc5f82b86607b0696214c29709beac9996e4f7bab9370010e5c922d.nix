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
      identifier = { name = "hS3"; version = "0.5.7"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2008, Greg Heartsfield";
      maintainer = "Greg Heartsfield <scsibug@imap.cc>";
      author = "Greg Heartsfield <scsibug@imap.cc>";
      homepage = "http://gregheartsfield.com/hS3/";
      url = "";
      synopsis = "Interface to Amazon's Simple Storage Service (S3)";
      description = "This is the Haskell S3 library.  It provides an\ninterface to Amazon's Simple Storage Service (S3), allowing Haskell\ndevelopers to reliably store and retrieve arbitrary amounts of\ndata from anywhere on the Internet.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
          (hsPkgs."Crypto" or (errorHandler.buildDepError "Crypto"))
          (hsPkgs."hxt" or (errorHandler.buildDepError "hxt"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          (hsPkgs."dataenc" or (errorHandler.buildDepError "dataenc"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."MissingH" or (errorHandler.buildDepError "MissingH"))
          ];
        buildable = true;
        };
      exes = { "hs3" = { buildable = true; }; };
      };
    }