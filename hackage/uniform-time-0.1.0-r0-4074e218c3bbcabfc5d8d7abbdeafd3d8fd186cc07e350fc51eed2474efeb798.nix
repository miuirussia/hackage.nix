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
      specVersion = "2.2";
      identifier = { name = "uniform-time"; version = "0.1.0"; };
      license = "GPL-2.0-only";
      copyright = "2021 Andrew U. Frank";
      maintainer = "Andrew U. Frank <uniform@gerastree.at>";
      author = "Andrew Frank";
      homepage = "";
      url = "";
      synopsis = "Time in the uniform framework";
      description = "A very small package for time\n\nbridges between function on\n\n- UTCTime\n\n- EpochTime\n\nwith an `IsString` for UTCTime\n\nPlease see the README on GitHub at <https://github.com/andrewufrank/uniform-time/readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."convertible" or (errorHandler.buildDepError "convertible"))
          (hsPkgs."monads-tf" or (errorHandler.buildDepError "monads-tf"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."uniform-algebras" or (errorHandler.buildDepError "uniform-algebras"))
          (hsPkgs."uniform-error" or (errorHandler.buildDepError "uniform-error"))
          (hsPkgs."uniform-strings" or (errorHandler.buildDepError "uniform-strings"))
          ];
        buildable = true;
        };
      };
    }