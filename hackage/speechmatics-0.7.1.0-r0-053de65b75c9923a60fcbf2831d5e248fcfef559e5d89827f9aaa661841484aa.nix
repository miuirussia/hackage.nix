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
      identifier = { name = "speechmatics"; version = "0.7.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Daisee Pty Ltd";
      maintainer = "jappie.klooster@daisee.com";
      author = "Jappie Klooster";
      homepage = "https://bitbucket.org/daisee/speechmatics-api-client/";
      url = "";
      synopsis = "Speechmatics api client";
      description = "Upload audio files to speechmatics to get a transcription";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."HsOpenSSL" or (errorHandler.buildDepError "HsOpenSSL"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."heavy-logger" or (errorHandler.buildDepError "heavy-logger"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-openssl" or (errorHandler.buildDepError "http-client-openssl"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."json-autotype" or (errorHandler.buildDepError "json-autotype"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mime-types" or (errorHandler.buildDepError "mime-types"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-format-heavy" or (errorHandler.buildDepError "text-format-heavy"))
          (hsPkgs."wreq" or (errorHandler.buildDepError "wreq"))
          ];
        buildable = true;
        };
      exes = {
        "speechmatics" = {
          depends = [
            (hsPkgs."SHA" or (errorHandler.buildDepError "SHA"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."heavy-logger" or (errorHandler.buildDepError "heavy-logger"))
            (hsPkgs."mime-types" or (errorHandler.buildDepError "mime-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."options" or (errorHandler.buildDepError "options"))
            (hsPkgs."speechmatics" or (errorHandler.buildDepError "speechmatics"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-format-heavy" or (errorHandler.buildDepError "text-format-heavy"))
            ];
          buildable = true;
          };
        };
      tests = {
        "speechmatics-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."heavy-logger" or (errorHandler.buildDepError "heavy-logger"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."neat-interpolation" or (errorHandler.buildDepError "neat-interpolation"))
            (hsPkgs."speechmatics" or (errorHandler.buildDepError "speechmatics"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-format-heavy" or (errorHandler.buildDepError "text-format-heavy"))
            ];
          buildable = true;
          };
        };
      };
    }