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
      identifier = { name = "qr-imager"; version = "1.0.1.8"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2016-2018 Vanessa McHale";
      maintainer = "vamchale@gmail.com";
      author = "Vanessa McHale";
      homepage = "https://github.com/vmchale/QRImager#readme";
      url = "";
      synopsis = "Library to generate QR codes from bytestrings and objects";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          (hsPkgs."cryptonite" or (errorHandler.buildDepError "cryptonite"))
          (hsPkgs."jose-jwt" or (errorHandler.buildDepError "jose-jwt"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."haskell-qrencode" or (errorHandler.buildDepError "haskell-qrencode"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          ];
        pkgconfig = [
          (pkgconfPkgs."libqrencode" or (errorHandler.pkgConfDepError "libqrencode"))
          ];
        buildable = true;
        };
      tests = {
        "test-lib" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."qr-imager" or (errorHandler.buildDepError "qr-imager"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }