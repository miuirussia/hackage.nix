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
      specVersion = "1.2";
      identifier = { name = "bindings-libusb"; version = "1.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Maurício C. Antunes <mauricio.antunes@gmail.com>";
      author = "Maurício C. Antunes";
      homepage = "http://bitbucket.org/mauricio/bindings-libusb";
      url = "";
      synopsis = "Low level bindings to libusb.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bindings-common" or (errorHandler.buildDepError "bindings-common"))
          (hsPkgs."bindings-posix" or (errorHandler.buildDepError "bindings-posix"))
          ];
        pkgconfig = [
          (pkgconfPkgs."libusb-1.0" or (errorHandler.pkgConfDepError "libusb-1.0"))
          ];
        buildable = true;
        };
      };
    }