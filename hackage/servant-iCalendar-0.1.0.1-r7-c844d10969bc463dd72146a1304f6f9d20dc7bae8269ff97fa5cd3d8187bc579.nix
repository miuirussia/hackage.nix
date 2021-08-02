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
      identifier = { name = "servant-iCalendar"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Francesco Gazzetta <fgaz@fgaz.me>";
      author = "Francesco Gazzetta";
      homepage = "https://github.com/fgaz/servant-iCalendar#readme";
      url = "";
      synopsis = "Servant support for iCalendar";
      description = "Servant support for iCalendar";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."http-media" or (errorHandler.buildDepError "http-media"))
          (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
          (hsPkgs."iCalendar" or (errorHandler.buildDepError "iCalendar"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          ];
        buildable = true;
        };
      };
    }