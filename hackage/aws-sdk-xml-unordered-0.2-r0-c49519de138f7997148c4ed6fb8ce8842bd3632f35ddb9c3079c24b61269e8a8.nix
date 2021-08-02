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
      identifier = { name = "aws-sdk-xml-unordered"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Shohei Yasutake <amutake.s@gmail.com>";
      author = "Shohei Yasutake <amutake.s@gmail.com>";
      homepage = "https://github.com/worksap-ate/aws-sdk-xml-unordered";
      url = "";
      synopsis = "The xml parser for aws-sdk";
      description = "This package provides the unordered xml parser for aws-sdk.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
          (hsPkgs."xml-types" or (errorHandler.buildDepError "xml-types"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."aws-sdk-text-converter" or (errorHandler.buildDepError "aws-sdk-text-converter"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
            (hsPkgs."aws-sdk-xml-unordered" or (errorHandler.buildDepError "aws-sdk-xml-unordered"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }