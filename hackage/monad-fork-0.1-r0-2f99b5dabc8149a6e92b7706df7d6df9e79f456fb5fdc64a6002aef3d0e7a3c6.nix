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
      identifier = { name = "monad-fork"; version = "0.1"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "anarchomorphism@seomraspraoi.org";
      author = "Robin Banks";
      homepage = "";
      url = "";
      synopsis = "Type class for monads which support a fork operation.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          ];
        buildable = true;
        };
      };
    }