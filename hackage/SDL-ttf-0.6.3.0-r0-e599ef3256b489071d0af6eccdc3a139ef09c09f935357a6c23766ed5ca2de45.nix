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
      identifier = { name = "SDL-ttf"; version = "0.6.3.0"; };
      license = "BSD-3-Clause";
      copyright = "2004-2010, Lemmih";
      maintainer = "Francesco Ariis <fa-ml@ariis.it>";
      author = "Lemmih (lemmih@gmail.com)";
      homepage = "";
      url = "";
      synopsis = "Binding to libSDL_ttf";
      description = "This is a sample library which allows you to use TrueType\nfonts in your SDL applications.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (errorHandler.setupDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (errorHandler.setupDepError "Cabal")))
        ];
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."SDL" or (errorHandler.buildDepError "SDL"))
          ];
        libs = [ (pkgs."SDL_ttf" or (errorHandler.sysDepError "SDL_ttf")) ];
        buildable = true;
        };
      };
    }