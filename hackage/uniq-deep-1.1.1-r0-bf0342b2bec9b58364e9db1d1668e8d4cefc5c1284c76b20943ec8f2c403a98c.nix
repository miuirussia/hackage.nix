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
      identifier = { name = "uniq-deep"; version = "1.1.1"; };
      license = "LicenseRef-PublicDomain";
      copyright = "© ncaq";
      maintainer = "ncaq@ncaq.net";
      author = "ncaq";
      homepage = "https://github.com/ncaq/uniq-deep#readme";
      url = "";
      synopsis = "uniq-deep";
      description = "alternative of unix uniq command. 'uniq-deep' detect repeated lines unless they are adjacent.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "uniq-deep" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      };
    }