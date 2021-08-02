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
      identifier = { name = "aws-sdk-xml-unordered"; version = "0.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Shohei Yasutake <amutake.s@gmail.com>";
      author = "Shohei Yasutake <amutake.s@gmail.com>";
      homepage = "https://github.com/worksap-ate/aws-sdk-xml-unordered";
      url = "";
      synopsis = "The xml parser for aws-sdk package";
      description = "This package provides the unordered xml parser for aws-sdk package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
          (hsPkgs."xml-types" or (errorHandler.buildDepError "xml-types"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."lifted-base" or (errorHandler.buildDepError "lifted-base"))
          (hsPkgs."aws-sdk-text-converter" or (errorHandler.buildDepError "aws-sdk-text-converter"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
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
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            ];
          buildable = true;
          };
        };
      };
    }