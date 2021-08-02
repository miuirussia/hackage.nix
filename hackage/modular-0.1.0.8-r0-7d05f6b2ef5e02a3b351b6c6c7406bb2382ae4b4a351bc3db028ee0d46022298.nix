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
      identifier = { name = "modular"; version = "0.1.0.8"; };
      license = "BSD-3-Clause";
      copyright = "2018 Preetham Gujjula";
      maintainer = "preetham.gujjula@gmail.com";
      author = "Preetham Gujjula";
      homepage = "https://github.com/pgujjula/modular#readme";
      url = "";
      synopsis = "Type-safe modular arithmetic";
      description = "Please see the GitHub page at <https://github.com/pgujjula/modular> for installation instructions, and the module documentation for Numeric.Modular for usage instructions.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
          ];
        buildable = true;
        };
      };
    }