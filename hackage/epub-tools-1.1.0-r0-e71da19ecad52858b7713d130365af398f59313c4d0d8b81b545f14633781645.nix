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
      identifier = { name = "epub-tools"; version = "1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "2008-2011 Dino Morelli ";
      maintainer = "Dino Morelli <dino@ui3.info>";
      author = "Dino Morelli ";
      homepage = "http://ui3.info/d/proj/epub-tools.html";
      url = "";
      synopsis = "Command line utilities for working with epub files";
      description = "A suite of command-line utilities for creating and manipulating epub book files. Included are: epubmeta, epubname, epubzip";
      buildType = "Simple";
      };
    components = {
      exes = {
        "epubmeta" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."epub-metadata" or (errorHandler.buildDepError "epub-metadata"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."zip-archive" or (errorHandler.buildDepError "zip-archive"))
            ];
          buildable = true;
          };
        "epubname" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."epub-metadata" or (errorHandler.buildDepError "epub-metadata"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
            ];
          buildable = true;
          };
        "epubzip" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."epub-metadata" or (errorHandler.buildDepError "epub-metadata"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
            ];
          buildable = true;
          };
        };
      tests = {
        "epubname-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."epub-metadata" or (errorHandler.buildDepError "epub-metadata"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
            ];
          buildable = true;
          };
        };
      };
    }