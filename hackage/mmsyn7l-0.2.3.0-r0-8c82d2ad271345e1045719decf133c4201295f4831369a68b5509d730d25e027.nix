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
      identifier = { name = "mmsyn7l"; version = "0.2.3.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "olexandr543@yahoo.com";
      author = "(c) OleksandrZhabenko 2020";
      homepage = "https://hackage.haskell.org/package/mmsyn7l";
      url = "";
      synopsis = "Modifies the amplitude of the sound representations for the Ukrainian language created by mmsyn7ukr package.";
      description = "A program and a library to modify the amplitude of the sound representations for the Ukrainian language created by mmsyn7ukr package or somehow otherwise.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."mmsyn7ukr" or (errorHandler.buildDepError "mmsyn7ukr"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."mmsyn2" or (errorHandler.buildDepError "mmsyn2"))
          ];
        buildable = true;
        };
      exes = {
        "mmsyn7l" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."mmsyn7ukr" or (errorHandler.buildDepError "mmsyn7ukr"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mmsyn2" or (errorHandler.buildDepError "mmsyn2"))
            ];
          buildable = true;
          };
        };
      };
    }