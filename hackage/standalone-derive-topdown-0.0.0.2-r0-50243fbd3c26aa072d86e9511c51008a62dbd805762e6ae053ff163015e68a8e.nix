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
      identifier = { name = "standalone-derive-topdown"; version = "0.0.0.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "Haskell.Zhang.Song@hotmail.com";
      author = "songzh";
      homepage = "https://github.com/HaskellZhangSong/TopdownDerive";
      url = "";
      synopsis = "This package will derive class instance along the data type declaration tree. (Deprecated)";
      description = "This package is Deprecated. Please use derive-topdown package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
        buildable = true;
        };
      };
    }