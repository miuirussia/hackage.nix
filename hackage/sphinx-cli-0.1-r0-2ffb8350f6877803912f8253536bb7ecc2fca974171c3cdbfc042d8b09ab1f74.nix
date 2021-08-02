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
      identifier = { name = "sphinx-cli"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2008 Tupil";
      maintainer = "Eelco Lempsink <eml+sphinx@tupil.com>";
      author = "Tupil";
      homepage = "";
      url = "";
      synopsis = "Sphinx CLI and demo of Haskell Sphinx library";
      description = "Sphinx CLI and demo of Haskell Sphinx library.  This program\nis almost the same as the 'search' command of Sphinx and intended to be used\nfor testing and debugging only.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "sphinx-cli" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."sphinx" or (errorHandler.buildDepError "sphinx"))
            ];
          buildable = true;
          };
        };
      };
    }