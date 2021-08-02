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
      identifier = { name = "wolf"; version = "0.3.1"; };
      license = "MIT";
      copyright = "Copyright (C) 2015 Swift Navigation, Inc.";
      maintainer = "Mark Fine <dev@swiftnav.com>";
      author = "Swift Navigation Inc.";
      homepage = "https://github.com/swift-nav/wolf";
      url = "";
      synopsis = "Amazon Simple Workflow Service Wrapper.";
      description = "Wolf is a wrapper around Amazon Simple Workflow Service.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."amazonka" or (errorHandler.buildDepError "amazonka"))
          (hsPkgs."amazonka-core" or (errorHandler.buildDepError "amazonka-core"))
          (hsPkgs."amazonka-s3" or (errorHandler.buildDepError "amazonka-s3"))
          (hsPkgs."amazonka-swf" or (errorHandler.buildDepError "amazonka-swf"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-combinators" or (errorHandler.buildDepError "conduit-combinators"))
          (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."fast-logger" or (errorHandler.buildDepError "fast-logger"))
          (hsPkgs."filemanip" or (errorHandler.buildDepError "filemanip"))
          (hsPkgs."formatting" or (errorHandler.buildDepError "formatting"))
          (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."lifted-async" or (errorHandler.buildDepError "lifted-async"))
          (hsPkgs."lifted-base" or (errorHandler.buildDepError "lifted-base"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."monad-logger" or (errorHandler.buildDepError "monad-logger"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."mtl-compat" or (errorHandler.buildDepError "mtl-compat"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."preamble" or (errorHandler.buildDepError "preamble"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."regex-applicative" or (errorHandler.buildDepError "regex-applicative"))
          (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-manipulate" or (errorHandler.buildDepError "text-manipulate"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          ];
        buildable = true;
        };
      exes = {
        "wolf-register" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            ];
          buildable = true;
          };
        "wolf-execute" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            ];
          buildable = true;
          };
        "wolf-decide" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            ];
          buildable = true;
          };
        "wolf-act" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."amazonka-core" or (errorHandler.buildDepError "amazonka-core"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."shelly" or (errorHandler.buildDepError "shelly"))
            (hsPkgs."system-filepath" or (errorHandler.buildDepError "system-filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
            ];
          buildable = true;
          };
        "wolf-act2" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."amazonka-core" or (errorHandler.buildDepError "amazonka-core"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."shelly" or (errorHandler.buildDepError "shelly"))
            (hsPkgs."system-filepath" or (errorHandler.buildDepError "system-filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
            ];
          buildable = true;
          };
        "wolf-actor" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            (hsPkgs."optparse-generic" or (errorHandler.buildDepError "optparse-generic"))
            ];
          buildable = true;
          };
        "wolf-decider" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            (hsPkgs."optparse-generic" or (errorHandler.buildDepError "optparse-generic"))
            ];
          buildable = true;
          };
        "shake-wolf" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."wolf" or (errorHandler.buildDepError "wolf"))
            ];
          buildable = true;
          };
        };
      };
    }