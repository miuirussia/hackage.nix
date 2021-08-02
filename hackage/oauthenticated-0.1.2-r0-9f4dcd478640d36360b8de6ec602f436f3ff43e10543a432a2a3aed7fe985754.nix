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
      identifier = { name = "oauthenticated"; version = "0.1.2"; };
      license = "MIT";
      copyright = "2013 (c) Joseph Abrahamson";
      maintainer = "me@jspha.com";
      author = "Joseph Abrahamson";
      homepage = "";
      url = "";
      synopsis = "Simple OAuth for http-client";
      description = "/Warning/: This software is pre 1.0 and thus its API may change very\ndynamically while updating only minor versions. This package will follow the\nPVP once it reaches version 1.0.\n\nOAuth is a popular protocol allowing servers to offer resources owned by some\nuser to a series of authorized clients securely. For instance, OAuth lets\nTwitter provide access to a user's private tweets to the Twitter client\nregistered on their phone.\n\n@oauthenticated@ is a Haskell library implementing OAuth protocols atop the\nminimalistic @http-client@ HTTP client library extracted from @http-conduit@.\n\"Network.OAuth\" offers simple functions for signing\n'Network.HTTP.Client.Request's along with tools for 'Network.OAuth.Cred'ential\nmanagement and 'Network.OAuth.Server' configuration. \"Network.OAuth.Simple\"\nprovides a slightly more heavy-weight interface which manages the necessary state\nand configuration using a monad transformer stack.\n\nThere's also an implementation of OAuth's three-legged credential acquisition\nprotocol built atop the \"Network.OAuth\" API. This can be handled in both\nconformant and old-style modes: conformant will reject server responses which\nare not conformant with RFC 5849 (which builds atop community version OAuth\n1.0a) while old-style better allows for less-than-compliant servers. See\n'Network.OAuth.Types.Params.Version' for more details.\n\nCurrently @oauthenticated@ only supports OAuth 1.0 and is in alpha. OAuth 2.0\nsupport is a potential goal, but it's unclear if it can be transparently\nsupported at a similar level of abstraction.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."blaze-builder" or (errorHandler.buildDepError "blaze-builder"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."crypto-random" or (errorHandler.buildDepError "crypto-random"))
          (hsPkgs."cryptohash" or (errorHandler.buildDepError "cryptohash"))
          (hsPkgs."either" or (errorHandler.buildDepError "either"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }