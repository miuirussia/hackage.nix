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
      identifier = { name = "ribbit"; version = "0.2.0.0"; };
      license = "MIT";
      copyright = "2019 Owens Murray, LLC.";
      maintainer = "rick@owensmurray.com";
      author = "Rick Owens";
      homepage = "https://github.com/owensmurray/ribbit";
      url = "";
      synopsis = "ribbit";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."Only" or (errorHandler.buildDepError "Only"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."om-show" or (errorHandler.buildDepError "om-show"))
          (hsPkgs."postgresql-simple" or (errorHandler.buildDepError "postgresql-simple"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
        buildable = true;
        };
      };
    }