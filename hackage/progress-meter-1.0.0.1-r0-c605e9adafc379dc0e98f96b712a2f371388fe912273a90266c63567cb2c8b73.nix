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
    flags = { devel = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "progress-meter"; version = "1.0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2017 Ertugrul Söylemez";
      maintainer = "Ertugrul Söylemez <esz@posteo.de>";
      author = "Ertugrul Söylemez <esz@posteo.de>";
      homepage = "https://github.com/esoeylemez/progress-meter";
      url = "";
      synopsis = "Live diagnostics for concurrent activity";
      description = "This library can be used to display a progress bar or\nother live diagnostics for your application.  It supports partial\nupdates from multiple threads without interfering with each other,\nand it has the correct behaviour when printing diagnostics that are\nnot part of the progress bar and should just scroll by.\n\nThe @System.Progress@ module contains a tutorial.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          ] ++ (pkgs.lib).optionals (flags.devel) [
          (hsPkgs."rapid" or (errorHandler.buildDepError "rapid"))
          (hsPkgs."rapid-term" or (errorHandler.buildDepError "rapid-term"))
          ];
        buildable = true;
        };
      };
    }