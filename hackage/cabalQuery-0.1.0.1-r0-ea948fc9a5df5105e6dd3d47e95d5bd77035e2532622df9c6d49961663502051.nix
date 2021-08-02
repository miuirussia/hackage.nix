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
      specVersion = "1.18";
      identifier = { name = "cabalQuery"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2015, Rogan Creswick";
      maintainer = "creswick@gmail.com";
      author = "Rogan Creswick";
      homepage = "http://github.com/creswick/cabal-query";
      url = "";
      synopsis = "A simple tool to query cabal files.";
      description = "Command line access to the cabal package description\nfiles.\n\ncabalQuery allows you to query one or more .cabal files\nfor fields that may be useful in other contexts, such\nas a build system, where you may need the version number,\nlincense, authors, copyright, etc.. in a programatic way,\nbut without access to the Cabal libraries.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          ];
        buildable = true;
        };
      exes = {
        "cabalQuery" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabalQuery" or (errorHandler.buildDepError "cabalQuery"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."MissingH" or (errorHandler.buildDepError "MissingH"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      };
    }