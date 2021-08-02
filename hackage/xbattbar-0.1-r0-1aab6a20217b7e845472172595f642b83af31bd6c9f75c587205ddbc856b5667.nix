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
      specVersion = "1.4";
      identifier = { name = "xbattbar"; version = "0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "plhk@sdf.org";
      author = "Alexander Polakov";
      homepage = "https://github.com/polachok/xbattbar";
      url = "";
      synopsis = "Simple battery indicator";
      description = "XBattBar is a simple battery indicator for X11/Linux.\nIt draws a vertical or horizontal bar on your screen,\nwhich displays current power and charging status with\ncolor lines. A popup window appears when mouse cursor\nenters the indicator area. It shows current AC status,\nbattery level and time.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "xbattbar" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."select" or (errorHandler.buildDepError "select"))
            (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
            ];
          buildable = true;
          };
        };
      };
    }