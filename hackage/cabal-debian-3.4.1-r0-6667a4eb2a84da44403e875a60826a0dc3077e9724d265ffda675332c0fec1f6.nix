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
      specVersion = "1.8";
      identifier = { name = "cabal-debian"; version = "3.4.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "David Fox <dsf@seereason.com>";
      author = "David Fox <dsf@seereason.com>";
      homepage = "http://src.seereason.com/cabal-debian";
      url = "";
      synopsis = "Create a debianization for a cabal package";
      description = "Tool for creating debianizations of Haskell packages based on the .cabal\nfile.  If apt-file is installed it will use it to discover what is the\ndebian package name of a C library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."ansi-wl-pprint" or (errorHandler.buildDepError "ansi-wl-pprint"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-lens" or (errorHandler.buildDepError "data-lens"))
          (hsPkgs."debian" or (errorHandler.buildDepError "debian"))
          (hsPkgs."Diff" or (errorHandler.buildDepError "Diff"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hsemail" or (errorHandler.buildDepError "hsemail"))
          (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."pureMD5" or (errorHandler.buildDepError "pureMD5"))
          (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          ];
        buildable = true;
        };
      exes = {
        "cabal-debian" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabal-debian" or (errorHandler.buildDepError "cabal-debian"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-lens" or (errorHandler.buildDepError "data-lens"))
            ];
          buildable = true;
          };
        };
      };
    }