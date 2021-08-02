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
      specVersion = "1.8";
      identifier = { name = "pdf-toolbox-content"; version = "0.0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) Yuras Shumovich 2013";
      maintainer = "Yuras Shumovich <shumovichy@gmail.com>";
      author = "Yuras Shumovich";
      homepage = "";
      url = "";
      synopsis = "A collection of tools for processing PDF files";
      description = "Tools for processing PDF content streams";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
          (hsPkgs."encoding" or (errorHandler.buildDepError "encoding"))
          (hsPkgs."pdf-toolbox-core" or (errorHandler.buildDepError "pdf-toolbox-core"))
          ];
        buildable = true;
        };
      };
    }