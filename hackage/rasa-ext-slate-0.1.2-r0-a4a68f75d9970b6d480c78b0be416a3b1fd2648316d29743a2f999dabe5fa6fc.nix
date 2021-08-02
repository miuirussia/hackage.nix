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
      identifier = { name = "rasa-ext-slate"; version = "0.1.2"; };
      license = "MIT";
      copyright = "2016 Chris Penner";
      maintainer = "christopher.penner@gmail.com";
      author = "Chris Penner";
      homepage = "https://github.com/ChrisPenner/rasa/";
      url = "";
      synopsis = "Rasa extension for rendering to terminal with vty";
      description = "Rasa extension for rendering to terminal with vty";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."rasa" or (errorHandler.buildDepError "rasa"))
          (hsPkgs."rasa-ext-bufs" or (errorHandler.buildDepError "rasa-ext-bufs"))
          (hsPkgs."rasa-ext-style" or (errorHandler.buildDepError "rasa-ext-style"))
          (hsPkgs."rasa-ext-status-bar" or (errorHandler.buildDepError "rasa-ext-status-bar"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."yi-rope" or (errorHandler.buildDepError "yi-rope"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
          (hsPkgs."rasa-ext-logger" or (errorHandler.buildDepError "rasa-ext-logger"))
          ];
        buildable = true;
        };
      };
    }