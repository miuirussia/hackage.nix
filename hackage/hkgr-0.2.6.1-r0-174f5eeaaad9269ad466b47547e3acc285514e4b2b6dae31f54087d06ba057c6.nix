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
      specVersion = "2.0";
      identifier = { name = "hkgr"; version = "0.2.6.1"; };
      license = "GPL-3.0-only";
      copyright = "2019-2020  Jens Petersen";
      maintainer = "juhpetersen@gmail.com";
      author = "Jens Petersen";
      homepage = "https://github.com/juhp/hkgr";
      url = "";
      synopsis = "Simple Hackage release workflow for package maintainers";
      description = "Hkgr (pronounced \"Hackager\") is a tool to help make new releases of\nHaskell packages, with commands for git tagging, pristine sdist,\nand uploading to Hackage.\nThere is also a command for creating a new local project.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hkgr" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."simple-cabal" or (errorHandler.buildDepError "simple-cabal"))
            (hsPkgs."simple-cmd" or (errorHandler.buildDepError "simple-cmd"))
            (hsPkgs."simple-cmd-args" or (errorHandler.buildDepError "simple-cmd-args"))
            (hsPkgs."xdg-basedir" or (errorHandler.buildDepError "xdg-basedir"))
            ];
          buildable = true;
          };
        };
      };
    }