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
      identifier = { name = "fortran-src-extras"; version = "0.2.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "thefirstmuffinman@gmail.com";
      author = "";
      homepage = "https://github.com/camfort/fortran-src-extras#readme";
      url = "";
      synopsis = "Common functions and utils for fortran-src.";
      description = "Various utility functions and orphan instances which may be useful when using fortran-src.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."GenericPretty" or (errorHandler.buildDepError "GenericPretty"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."fortran-src" or (errorHandler.buildDepError "fortran-src"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."uniplate" or (errorHandler.buildDepError "uniplate"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."fortran-src" or (errorHandler.buildDepError "fortran-src"))
            (hsPkgs."fortran-src-extras" or (errorHandler.buildDepError "fortran-src-extras"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."silently" or (errorHandler.buildDepError "silently"))
            (hsPkgs."uniplate" or (errorHandler.buildDepError "uniplate"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover.components.exes.hspec-discover or (pkgs.buildPackages.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
            ];
          buildable = true;
          };
        };
      };
    }