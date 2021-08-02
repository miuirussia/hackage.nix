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
      identifier = { name = "steeloverseer"; version = "0.1.0.2"; };
      license = "MIT";
      copyright = "Schell Scivally 2013";
      maintainer = "efsubenovex@gmail.com";
      author = "Schell Scivally";
      homepage = "https://github.com/schell/steeloverseer";
      url = "";
      synopsis = "A tool that runs a list of commands after files change on disk.";
      description = "A command line tool that responds to changes in certain files by running\nspecific commands. Similar to the codemonitor project but simpler and\n(hopefully) cross platform.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "sos" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."fsnotify" or (errorHandler.buildDepError "fsnotify"))
            (hsPkgs."system-filepath" or (errorHandler.buildDepError "system-filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            ];
          buildable = true;
          };
        };
      };
    }