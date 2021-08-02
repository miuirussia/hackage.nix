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
      specVersion = "1.10";
      identifier = { name = "ghc-syb-utils"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) Claus Reinke 2008";
      maintainer = "Daniel Gröber <dxld@darkboxed.org>";
      author = "Claus Reinke";
      homepage = "https://github.com/DanielG/ghc-syb";
      url = "";
      synopsis = "Scrap Your Boilerplate utilities for the GHC API.";
      description = "Scrap Your Boilerplate utilities for the GHC API.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        buildable = true;
        };
      };
    }