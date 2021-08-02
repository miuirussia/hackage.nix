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
      identifier = { name = "hascal"; version = "3.0.1"; };
      license = "LicenseRef-GPL";
      copyright = "Mekeor Melire (2017)";
      maintainer = "Mekeor Melire";
      author = "Mekeor Melire";
      homepage = "https://github.com/mekeor/hascal";
      url = "";
      synopsis = "tiny calculator library and command-line program";
      description = "a library and a command-line program for calculating numeral\nexpressions with infix operators and constants but without\nparantheses.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          ];
        buildable = true;
        };
      exes = {
        "hascal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            ];
          buildable = true;
          };
        };
      };
    }