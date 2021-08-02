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
      identifier = { name = "ac-machine-conduit"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Yuta Taniguchi <yuta.taniguchi.y.t@gmail.com>";
      author = "Yuta Taniguchi <yuta.taniguchi.y.t@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Drive Aho-Corasick machines in Conduit pipelines";
      description = "Drive Aho-Corasick machines in Conduit pipelines.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ac-machine" or (errorHandler.buildDepError "ac-machine"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
        buildable = true;
        };
      };
    }