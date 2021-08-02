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
      identifier = { name = "io-capture"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nonowarn@gmail.com";
      author = "Yusaku Hashimoto";
      homepage = "";
      url = "";
      synopsis = "capture IO action's stdout and stderr";
      description = "capture IO action's stdout and stderr";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          ];
        buildable = true;
        };
      };
    }