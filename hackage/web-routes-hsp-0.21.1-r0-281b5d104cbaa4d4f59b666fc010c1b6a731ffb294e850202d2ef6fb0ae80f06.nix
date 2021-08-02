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
      identifier = { name = "web-routes-hsp"; version = "0.21.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "partners@seereason.com";
      author = "jeremy@seereason.com";
      homepage = "";
      url = "";
      synopsis = "Adds XMLGenerator instance for RouteT monad";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hsx" or (errorHandler.buildDepError "hsx"))
          (hsPkgs."hsp" or (errorHandler.buildDepError "hsp"))
          (hsPkgs."web-routes" or (errorHandler.buildDepError "web-routes"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
        buildable = true;
        };
      };
    }