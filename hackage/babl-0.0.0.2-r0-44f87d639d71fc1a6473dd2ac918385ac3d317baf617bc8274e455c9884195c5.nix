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
      identifier = { name = "babl"; version = "0.0.0.2"; };
      license = "LGPL-3.0-only";
      copyright = "";
      maintainer = "nek0@nek0.eu";
      author = "nek0";
      homepage = "http://github.com/nek0/babl#readme";
      url = "";
      synopsis = "Haskell bindings to BABL library.";
      description = "This package contains the Haskell bindings to the BABL\nlibrary.\nThis package is still unstable und evenminor version bumps\nmay contain breaking API changes.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        libs = [ (pkgs."babl-0.1" or (errorHandler.sysDepError "babl-0.1")) ];
        pkgconfig = [
          (pkgconfPkgs."babl" or (errorHandler.pkgConfDepError "babl"))
          ];
        buildable = true;
        };
      };
    }