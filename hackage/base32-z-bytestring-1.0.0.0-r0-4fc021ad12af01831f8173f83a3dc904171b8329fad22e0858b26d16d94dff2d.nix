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
      identifier = { name = "base32-z-bytestring"; version = "1.0.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013, Sam Truzjan, 2019 Oscoin Engineering Team";
      maintainer = "Sam Truzjan <pxqr.sta@gmail.com>";
      author = "Sam Truzjan, Oscoin Engineering Team";
      homepage = "https://github.com/oscoin/z-base32-bytestring";
      url = "";
      synopsis = "Fast z-base32 and z-base32hex codec for ByteStrings";
      description = "base32 and base32hex codec according to RFC4648\n<http://tools.ietf.org/html/rfc4648>, extended to support z-base32 encoding\naccording to <https://gist.github.com/maaku/8996338#file-bip-ecc32-mediawiki>\n\nThe package API is similar to base64-bytestring.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cpu" or (errorHandler.buildDepError "cpu"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."z-base32-bytestring" or (errorHandler.buildDepError "z-base32-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-fail-fast" or (errorHandler.buildDepError "tasty-fail-fast"))
            (hsPkgs."tasty-hedgehog" or (errorHandler.buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hspec" or (errorHandler.buildDepError "tasty-hspec"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."z-base32-bytestring" or (errorHandler.buildDepError "z-base32-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }