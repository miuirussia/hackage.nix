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
      identifier = { name = "dlist-instances"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "2013 Greg Weber";
      maintainer = "Greg Weber <greg@gregweber.info>";
      author = "Greg Weber";
      homepage = "https://github.com/gregwebs/dlist-instances";
      url = "";
      synopsis = "Difference lists instances";
      description = "See the dlist packages.\nThis package is the canonical source for some orphan instances.\nOrphan instances are placed here to avoid dependencies elsewhere.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          ];
        buildable = true;
        };
      };
    }