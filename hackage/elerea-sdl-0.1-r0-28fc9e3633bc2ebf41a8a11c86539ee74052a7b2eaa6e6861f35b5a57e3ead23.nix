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
      identifier = { name = "elerea-sdl"; version = "0.1"; };
      license = "LicenseRef-OtherLicense";
      copyright = "© 2011-2012 Stephen Paul Weber";
      maintainer = "Stephen Paul Weber <singpolyma@singpolyma.net>";
      author = "Stephen Paul Weber <singpolyma@singpolyma.net>";
      homepage = "http://github.com/singpolyma/elerea-sdl";
      url = "";
      synopsis = "Elerea FRP wrapper for SDL";
      description = "This is an FRP wrapper for SDL using Elerea.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."elerea" or (errorHandler.buildDepError "elerea"))
          (hsPkgs."SDL" or (errorHandler.buildDepError "SDL"))
          ];
        buildable = true;
        };
      };
    }