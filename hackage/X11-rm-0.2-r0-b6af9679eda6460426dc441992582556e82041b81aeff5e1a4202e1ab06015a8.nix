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
      specVersion = "1.0";
      identifier = { name = "X11-rm"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Troels Henriksen <athas@sigkill.dk>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "A binding to the resource management functions missing from X11.";
      description = "The binding is a direct translation of the C binding; for\ndocumentation of these calls, refer to \"The Xlib Programming\nManual\", available online at <http://tronche.com/gui/x/xlib/>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
          ];
        buildable = true;
        };
      };
    }