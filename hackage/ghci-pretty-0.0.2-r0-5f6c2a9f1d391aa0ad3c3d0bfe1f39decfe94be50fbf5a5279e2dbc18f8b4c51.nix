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
      specVersion = "1.12";
      identifier = { name = "ghci-pretty"; version = "0.0.2"; };
      license = "MIT";
      copyright = "Copyright (c) 2014 Lars Kuhtz <lakuhtz@gmail.com>";
      maintainer = "Lars Kuhtz <lakuhtz@gmail.com>";
      author = "Lars Kuhtz";
      homepage = "https://github.com/larskuhtz/ghci-pretty";
      url = "";
      synopsis = "colored pretty-printing within ghci";
      description = "A tiny package that combines the ipprint package and\nthe hscolour package to provide colored pretty-printing\nin ghci.\n\n/Usage/\n\nAdd the following lines to your @ghci.conf@ file:\n\n> -- Pretty printing of it\n> import IPPrint.Colored\n> :set -interactive-print=IPPrint.Colored.cpprint\n> :def cp (\\_ -> return \":set -interactive-print=IPPrint.Colored.cpprint\")\n> :def ncp (\\_ -> return \":set -interactive-print=print\")\n\nNow you can enable colored pretty-printing in ghci with the commmand\n\n> :cp\n\nThe following command turns colored pretty-printing off again\n\n> :ncp";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ipprint" or (errorHandler.buildDepError "ipprint"))
          (hsPkgs."hscolour" or (errorHandler.buildDepError "hscolour"))
          ];
        buildable = true;
        };
      };
    }