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
      specVersion = "1.8";
      identifier = { name = "marked-pretty"; version = "1.1.2.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Andy Gill <andygill@ku.edu>";
      author = "Andy Gill";
      homepage = "https://github.com/ku-fpg/marked-pretty";
      url = "";
      synopsis = "Pretty-printing library, with scoping, based on pretty.";
      description = "This package contains a pretty-printing library, with scoping.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."marked-pretty" or (errorHandler.buildDepError "marked-pretty"))
            ];
          buildable = true;
          };
        };
      };
    }