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
      identifier = { name = "spdx"; version = "0.0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2015 Oleg Grenrus";
      maintainer = "Oleg Grenrus <oleg.grenrus@iki.fi>";
      author = "Oleg Grenrus";
      homepage = "https://github.com/phadej/spdx";
      url = "";
      synopsis = "SPDX license expression language";
      description = "Implementation of <http://spdx.org/sites/spdx/files/SPDX-2.0.pdf SPDX> related functionality.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."spdx" or (errorHandler.buildDepError "spdx"))
            ];
          buildable = true;
          };
        };
      };
    }