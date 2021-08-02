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
      specVersion = "2.4";
      identifier = { name = "summoner-tui"; version = "2.0.1.1"; };
      license = "MPL-2.0";
      copyright = "2018-2020 Kowainik";
      maintainer = "Kowainik <xrom.xkov@gmail.com>";
      author = "Veronika Romashkina, Dmitrii Kovanikov";
      homepage = "https://github.com/kowainik/summoner";
      url = "";
      synopsis = "Tool for scaffolding fully configured batteries-included production-level Haskell projects using TUI.";
      description = "Tool for scaffolding fully configured batteries-included production-level Haskell projects using TUI.\nSee [README.md](https://github.com/kowainik/summoner#-summoner) for details.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."relude" or (errorHandler.buildDepError "relude"))
          (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
          (hsPkgs."colourista" or (errorHandler.buildDepError "colourista"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          (hsPkgs."microlens-th" or (errorHandler.buildDepError "microlens-th"))
          (hsPkgs."summoner" or (errorHandler.buildDepError "summoner"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."validation-selective" or (errorHandler.buildDepError "validation-selective"))
          (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
          ];
        buildable = if system.isWindows then false else true;
        };
      exes = {
        "summon-tui" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."relude" or (errorHandler.buildDepError "relude"))
            (hsPkgs."summoner-tui" or (errorHandler.buildDepError "summoner-tui"))
            ];
          buildable = if system.isWindows then false else true;
          };
        };
      };
    }