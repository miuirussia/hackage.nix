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
      specVersion = "2.2";
      identifier = { name = "wai-handler-hal"; version = "0.1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2021 Bellroy Pty Ltd";
      maintainer = "Bellroy Tech Team <haskell@bellroy.com>";
      author = "Bellroy Tech Team <haskell@bellroy.com>";
      homepage = "http://github.com/bellroy/wai-handler-hal";
      url = "";
      synopsis = "Wrap WAI applications to run on AWS Lambda";
      description = "This library provides a function 'Network.Wai.Handler.Hal.run' to\nlift a @wai@ 'Network.Wai.Application' into a function that can be\npassed to @hal@'s 'AWS.Lambda.Runtime.mRuntime'. This allows you to\nrun applications written in mature web frameworks (e.g., @servant@)\non AWS Lambda, as proxy integrations of API Gateway Rest APIs.\n\nMore details, including deployment advice, are available in the\nrepository's @README.md@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."hal" or (errorHandler.buildDepError "hal"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."vault" or (errorHandler.buildDepError "vault"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          ];
        buildable = true;
        };
      };
    }