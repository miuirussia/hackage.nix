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
    flags = { splitbase = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "HsOpenSSL"; version = "0.4.2"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "PHO <pho at cielonegro.org>";
      author = "Adam Langley <agl at imperialviolet.org>, PHO <pho at cielonegro.org>";
      homepage = "http://ccm.sherry.jp/HsOpenSSL/";
      url = "";
      synopsis = "(Part of) OpenSSL binding for Haskell";
      description = "HsOpenSSL is a (part of) OpenSSL binding for Haskell. It can\ngenerate RSA and DSA keys, read and write PEM files, generate\nmessage digests, sign and verify messages, encrypt and decrypt\nmessages.";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = if flags.splitbase
          then [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            ]
          else [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            ];
        buildable = true;
        };
      };
    }