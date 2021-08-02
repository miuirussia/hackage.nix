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
      specVersion = "1.2";
      identifier = { name = "HGamer3D"; version = "0.1.7"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "althainz@googlemail.com";
      author = "Peter Althainz";
      homepage = "http://www.althainz.de/HGamer3D.html";
      url = "";
      synopsis = "Library to enable 3D game development for Haskell";
      description = "Library, to enable 3D game development for Haskell,\nbased on bindings to 3D Graphics, Audio and GUI libraries.\nThis is the module, which includes all other needed modules and provides\nan higher level API for primary\nuse.\nPlatform: Windows only\nLicense: Apache License, Version 2.0\nInstall: see http://www.althainz.de/HGamer3D/Download-and-Installation.html";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."HGamer3D-Data" or (errorHandler.buildDepError "HGamer3D-Data"))
          (hsPkgs."HGamer3D-Ogre-Binding" or (errorHandler.buildDepError "HGamer3D-Ogre-Binding"))
          (hsPkgs."HGamer3D-SFML-Binding" or (errorHandler.buildDepError "HGamer3D-SFML-Binding"))
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          ];
        libs = [
          (pkgs."stdc++.dll" or (errorHandler.sysDepError "stdc++.dll"))
          ];
        buildable = true;
        };
      };
    }