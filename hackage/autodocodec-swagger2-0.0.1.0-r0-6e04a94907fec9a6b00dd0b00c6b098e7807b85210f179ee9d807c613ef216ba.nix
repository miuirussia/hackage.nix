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
      specVersion = "1.12";
      identifier = { name = "autodocodec-swagger2"; version = "0.0.1.0"; };
      license = "MIT";
      copyright = "2021 Tom Sydney Kerckhove";
      maintainer = "syd@cs-syd.eu";
      author = "Tom Sydney Kerckhove";
      homepage = "https://github.com/NorfairKing/autodocodec#readme";
      url = "";
      synopsis = "Autodocodec interpreters for swagger2";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."autodocodec" or (errorHandler.buildDepError "autodocodec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."insert-ordered-containers" or (errorHandler.buildDepError "insert-ordered-containers"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."swagger2" or (errorHandler.buildDepError "swagger2"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
        buildable = true;
        };
      };
    }