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
      specVersion = "1.10";
      identifier = { name = "repline"; version = "0.2.1.0"; };
      license = "MIT";
      copyright = "2014-2019 Stephen Diehl";
      maintainer = "stephen.m.diehl@gmail.com";
      author = "Stephen Diehl";
      homepage = "https://github.com/sdiehl/repline";
      url = "";
      synopsis = "Haskeline wrapper for GHCi-like REPL interfaces.";
      description = "Haskeline wrapper for GHCi-like REPL interfaces. Composable with normal mtl transformers.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."fail" or (errorHandler.buildDepError "fail"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."haskeline" or (errorHandler.buildDepError "haskeline"))
          ];
        buildable = true;
        };
      };
    }