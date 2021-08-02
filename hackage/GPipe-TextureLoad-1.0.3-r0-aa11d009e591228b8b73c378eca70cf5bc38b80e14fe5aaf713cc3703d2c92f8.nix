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
      identifier = { name = "GPipe-TextureLoad"; version = "1.0.3"; };
      license = "BSD-3-Clause";
      copyright = "Tobias Bexelius";
      maintainer = "Tobias Bexelius";
      author = "Tobias Bexelius";
      homepage = "http://www.haskell.org/haskellwiki/GPipe";
      url = "";
      synopsis = "Load GPipe textures from filesystem";
      description = "The functions of this package helps loading GPipe textures from file. It is based on the stb-image package, and supports subsets of the JPG, PNG, TGA, BMP and PSD formats.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."stb-image" or (errorHandler.buildDepError "stb-image"))
          (hsPkgs."GPipe" or (errorHandler.buildDepError "GPipe"))
          (hsPkgs."bitmap" or (errorHandler.buildDepError "bitmap"))
          ];
        buildable = true;
        };
      };
    }