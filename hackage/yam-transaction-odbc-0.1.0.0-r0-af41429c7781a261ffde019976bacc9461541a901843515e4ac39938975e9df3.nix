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
      identifier = { name = "yam-transaction-odbc"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2017 Daniel YU";
      maintainer = "i@icymint.me";
      author = "Daniel YU";
      homepage = "https://github.com/leptonyu/yam-transaction-odbc#readme";
      url = "";
      synopsis = "";
      description = "Transaction ODBC Plugin";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."yam-app" or (errorHandler.buildDepError "yam-app"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."HDBC-odbc" or (errorHandler.buildDepError "HDBC-odbc"))
          (hsPkgs."persistent-odbc" or (errorHandler.buildDepError "persistent-odbc"))
          ];
        buildable = true;
        };
      };
    }