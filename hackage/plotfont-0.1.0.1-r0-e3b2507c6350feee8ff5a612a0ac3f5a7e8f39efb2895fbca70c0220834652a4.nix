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
      identifier = { name = "plotfont"; version = "0.1.0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "ex-hackage@mjoldfield.com";
      author = "M J Oldfield";
      homepage = "";
      url = "";
      synopsis = "Plotter-like fonts i.e. a series of straight lines which make letter shapes.";
      description = "Crude fonts for XY plotting";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      tests = {
        "Tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."plotfont" or (errorHandler.buildDepError "plotfont"))
            ];
          buildable = true;
          };
        };
      };
    }