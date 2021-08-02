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
    flags = { debug = false; };
    package = {
      specVersion = "1.4";
      identifier = { name = "uni-htk"; version = "2.2.1.3"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "chr.maeder@web.de";
      author = "uniform@informatik.uni-bremen.de";
      homepage = "http://www.informatik.uni-bremen.de/htk/";
      url = "";
      synopsis = "Graphical User Interface for Haskell Programs";
      description = "GUI toolkit based on Tcl\\/Tk";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."uni-util" or (errorHandler.buildDepError "uni-util"))
          (hsPkgs."uni-events" or (errorHandler.buildDepError "uni-events"))
          (hsPkgs."uni-posixutil" or (errorHandler.buildDepError "uni-posixutil"))
          (hsPkgs."uni-reactor" or (errorHandler.buildDepError "uni-reactor"))
          ];
        buildable = true;
        };
      };
    }