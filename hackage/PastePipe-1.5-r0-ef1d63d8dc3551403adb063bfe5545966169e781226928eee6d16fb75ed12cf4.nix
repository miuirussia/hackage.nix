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
      specVersion = "1.2";
      identifier = { name = "PastePipe"; version = "1.5"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "creswick@gmail.com";
      author = "Rogan Creswick";
      homepage = "http://github.com/creswick/pastepipe";
      url = "";
      synopsis = "CLI for pasting to lpaste.net";
      description = "PastePipe reads from standard in and posts to <lpaste.net>.\nIt will auto-detect your username, but that can be\noverridden with command line options (--user)\nTitles are set with -t, language with -l.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
          ];
        buildable = true;
        };
      exes = {
        "pastepipe" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
            ];
          buildable = true;
          };
        };
      };
    }