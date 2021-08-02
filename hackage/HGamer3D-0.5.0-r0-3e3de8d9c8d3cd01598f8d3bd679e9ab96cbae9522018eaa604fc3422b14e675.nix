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
      specVersion = "1.4";
      identifier = { name = "HGamer3D"; version = "0.5.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "althainz@gmail.com";
      author = "Peter Althainz";
      homepage = "http://www.hgamer3d.org";
      url = "";
      synopsis = "A Toolset for the Haskell Game Programmer";
      description = "HGamer3D is a toolset for developing 3D games in the programming\nlanguage Haskell. The game engine uses available libraries for 3D graphics,\nsound, input device handling, gui programming and other areas and make\nthose functions available for the Haskell programmer by providing\na Haskell API on top of that. HGamer3D is available on Windows and Linux.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."HGamer3D-Data" or (errorHandler.buildDepError "HGamer3D-Data"))
          (hsPkgs."HGamer3D-Common" or (errorHandler.buildDepError "HGamer3D-Common"))
          (hsPkgs."HGamer3D-Graphics3D" or (errorHandler.buildDepError "HGamer3D-Graphics3D"))
          (hsPkgs."HGamer3D-Audio" or (errorHandler.buildDepError "HGamer3D-Audio"))
          (hsPkgs."HGamer3D-Network" or (errorHandler.buildDepError "HGamer3D-Network"))
          (hsPkgs."HGamer3D-InputSystem" or (errorHandler.buildDepError "HGamer3D-InputSystem"))
          ];
        buildable = true;
        };
      };
    }