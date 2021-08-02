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
      specVersion = "1.2";
      identifier = { name = "gtk2hs-rpn"; version = "0.0.1"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "Maurício CA <mauricio.antunes@gmail.com>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "Adds a module to gtk2hs allowing layouts to\nbe defined using reverse polish notation.";
      description = "Adds a module 'Graphics.UI.Gtk.Layout.Rpn' to\ngtk2hs. This module defines a type 'RPN' for\noperators, and is an instance of Monoid class.\nYou can combine those operators to define a\nlayout, as well as buttons and other widgets.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
          (hsPkgs."cairo" or (errorHandler.buildDepError "cairo"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
            (hsPkgs."cairo" or (errorHandler.buildDepError "cairo"))
            ];
          buildable = true;
          };
        };
      };
    }