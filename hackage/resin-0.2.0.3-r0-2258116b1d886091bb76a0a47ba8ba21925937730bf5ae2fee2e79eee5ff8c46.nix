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
      specVersion = "2.2";
      identifier = { name = "resin"; version = "0.2.0.3"; };
      license = "BSD-2-Clause";
      copyright = "";
      maintainer = "carter at wellposed dot com";
      author = "Carter Tazio Schonwald";
      homepage = "http://github.com/cartazio/resin";
      url = "";
      synopsis = "High performance variable binders";
      description = "High Performance Variable Binders library";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
          (hsPkgs."ralist" or (errorHandler.buildDepError "ralist"))
          ];
        buildable = true;
        };
      };
    }