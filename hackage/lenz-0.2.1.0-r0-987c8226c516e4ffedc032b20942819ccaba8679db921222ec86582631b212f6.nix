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
      specVersion = "1.6";
      identifier = { name = "lenz"; version = "0.2.1.0"; };
      license = "BSD-3-Clause";
      copyright = "© Unix year 47 M Farkas-Dyck";
      maintainer = "strake888@gmail.com";
      author = "M Farkas-Dyck";
      homepage = "";
      url = "";
      synopsis = "Van Laarhoven lenses";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-unicode-symbols" or (errorHandler.buildDepError "base-unicode-symbols"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }