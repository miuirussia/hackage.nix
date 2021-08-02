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
      identifier = { name = "bloodhound"; version = "0.12.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2015, Chris Allen";
      maintainer = "cma@bitemyapp.com";
      author = "Chris Allen";
      homepage = "https://github.com/bitemyapp/bloodhound";
      url = "";
      synopsis = "ElasticSearch client library for Haskell";
      description = "ElasticSearch made awesome for Haskell hackers";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
          (hsPkgs."blaze-builder" or (errorHandler.buildDepError "blaze-builder"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."mtl-compat" or (errorHandler.buildDepError "mtl-compat"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bloodhound" or (errorHandler.buildDepError "bloodhound"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."quickcheck-properties" or (errorHandler.buildDepError "quickcheck-properties"))
            (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
            (hsPkgs."errors" or (errorHandler.buildDepError "errors"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
            ];
          buildable = true;
          };
        "doctests" = {
          depends = (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "7.8") [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bloodhound" or (errorHandler.buildDepError "bloodhound"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            ];
          buildable = if compiler.isGhc && (compiler.version).ge "7.8"
            then true
            else false;
          };
        };
      };
    }