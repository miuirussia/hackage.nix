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
      identifier = { name = "pipes-attoparsec"; version = "0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "p.capriotti@gmail.com";
      author = "Paolo Capriotti";
      homepage = "https://github.com/pcapriotti/pipes-extra";
      url = "";
      synopsis = "Utilities to convert a parser into a pipe.";
      description = "Utilities to convert a parser into a pipe.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."pipes-core" or (errorHandler.buildDepError "pipes-core"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          ];
        buildable = true;
        };
      };
    }