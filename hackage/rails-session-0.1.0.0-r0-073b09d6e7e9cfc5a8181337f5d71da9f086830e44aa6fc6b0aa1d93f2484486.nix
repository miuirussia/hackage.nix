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
      identifier = { name = "rails-session"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2016-2017 Philip Cunningham & Alfredo di Napoli";
      maintainer = "philip@irisconnect.co.uk";
      author = "Philip Cunningham & Alfredo di Napoli";
      homepage = "http://github.com/iconnect/rails-session#readme";
      url = "";
      synopsis = "Decrypt Ruby on Rails sessions in Haskell";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cryptonite" or (errorHandler.buildDepError "cryptonite"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."pbkdf" or (errorHandler.buildDepError "pbkdf"))
          (hsPkgs."ruby-marshal" or (errorHandler.buildDepError "ruby-marshal"))
          (hsPkgs."string-conv" or (errorHandler.buildDepError "string-conv"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "specs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."rails-session" or (errorHandler.buildDepError "rails-session"))
            (hsPkgs."ruby-marshal" or (errorHandler.buildDepError "ruby-marshal"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hspec" or (errorHandler.buildDepError "tasty-hspec"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }