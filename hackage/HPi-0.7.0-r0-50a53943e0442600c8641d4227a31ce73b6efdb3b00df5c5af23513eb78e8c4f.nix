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
      identifier = { name = "HPi"; version = "0.7.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013-2015 Wander Hillen";
      maintainer = "wjw.hillen@gmail.com";
      author = "Wander Hillen";
      homepage = "https://github.com/WJWH/HPi";
      url = "";
      synopsis = "GPIO, I2C and SPI functions for the Raspberry Pi.";
      description = "This package is a FFI wrapper around the bcm2835 library by Mike McCauley, it also includes a few utility functions for easier use of the imported functions.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        libs = [ (pkgs."bcm2835" or (errorHandler.sysDepError "bcm2835")) ];
        buildable = true;
        };
      };
    }