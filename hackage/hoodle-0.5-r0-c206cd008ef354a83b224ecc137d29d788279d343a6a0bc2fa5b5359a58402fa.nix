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
    flags = { dyre = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "hoodle"; version = "0.5"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "Ian-Woo Kim <ianwookim@gmail.com>";
      author = "Ian-Woo Kim";
      homepage = "http://ianwookim.org/hoodle";
      url = "";
      synopsis = "Executable for hoodle";
      description = "Hoodle is a pen notetaking program written in haskell. ";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
          (hsPkgs."configurator" or (errorHandler.buildDepError "configurator"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hoodle-core" or (errorHandler.buildDepError "hoodle-core"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ] ++ (pkgs.lib).optional (flags.dyre) (hsPkgs."dyre" or (errorHandler.buildDepError "dyre"));
        buildable = true;
        };
      exes = {
        "hoodle" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
            (hsPkgs."hoodle-core" or (errorHandler.buildDepError "hoodle-core"))
            (hsPkgs."hoodle" or (errorHandler.buildDepError "hoodle"))
            ];
          buildable = true;
          };
        };
      };
    }