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
      identifier = { name = "cal3d"; version = "0.1"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "let at = \"@\" in concat [\"gdweber\", at, \"iue.edu\"]";
      author = "Gregory D. Weber";
      homepage = "http://haskell.org/haskellwiki/Cal3d_animation";
      url = "";
      synopsis = "Haskell binding to the Cal3D animation library.";
      description = "Haskell binding to the Cal3D, a skeletal-based animation\nlibrary written in C++.\nSee also the related packages cal3d-opengl and cal3d-examples.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        libs = [ (pkgs."cal3d" or (errorHandler.sysDepError "cal3d")) ];
        buildable = true;
        };
      };
    }