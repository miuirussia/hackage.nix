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
      specVersion = "1.6";
      identifier = { name = "xmonad-utils"; version = "0.1.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "<abimelech@gmail.com>";
      author = "Andrea Rossato";
      homepage = "http://www.haskell.org/haskellwiki/Xmonad-utils";
      url = "";
      synopsis = "A small collection of X utilities";
      description = "A small collection of X utilities useful when\nrunning XMonad. It includes:\n\n* hxsel, which returns the text currently in the X selection;\n\n* hslock, a simple X screen lock;\n\n* hmanage: an utility to toggle the override-redirect property of any\nwindow;\n\n* and hhp, a simple utility to hide the pointer, similar\nto unclutter.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hxsel" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            ];
          buildable = true;
          };
        "hxput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            ];
          buildable = true;
          };
        "hslock" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            ];
          libs = [ (pkgs."crypt" or (errorHandler.sysDepError "crypt")) ];
          buildable = true;
          };
        "hmanage" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            ];
          buildable = true;
          };
        "hhp" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            ];
          buildable = true;
          };
        };
      };
    }