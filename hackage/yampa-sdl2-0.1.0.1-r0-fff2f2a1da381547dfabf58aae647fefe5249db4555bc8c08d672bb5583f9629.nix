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
      identifier = { name = "yampa-sdl2"; version = "0.1.0.1"; };
      license = "MIT";
      copyright = "2018 Simre";
      maintainer = "simre4775@gmail.com";
      author = "Simre";
      homepage = "https://github.com/Simre1/YampaSDL2#readme";
      url = "";
      synopsis = "Yampa and SDL2 made easy";
      description = "yampa-sdl2 lets you start coding your app right away instead of dealing with SDL2 first.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."StateVar" or (errorHandler.buildDepError "StateVar"))
          (hsPkgs."Yampa" or (errorHandler.buildDepError "Yampa"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."data-memocombinators" or (errorHandler.buildDepError "data-memocombinators"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "YampaSDL2-test" = {
          depends = [
            (hsPkgs."StateVar" or (errorHandler.buildDepError "StateVar"))
            (hsPkgs."Yampa" or (errorHandler.buildDepError "Yampa"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-memocombinators" or (errorHandler.buildDepError "data-memocombinators"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."yampa-sdl2" or (errorHandler.buildDepError "yampa-sdl2"))
            ];
          buildable = true;
          };
        };
      };
    }