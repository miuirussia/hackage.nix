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
      identifier = { name = "stm-chans"; version = "3.0.0.6"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2011–2021 wren gayle romano";
      maintainer = "wren@cpan.org";
      author = "wren gayle romano, Thomas DuBuisson";
      homepage = "https://wrengr.org/software/hackage.html";
      url = "";
      synopsis = "Additional types of channels for STM.";
      description = "Additional types of channels for STM.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          ];
        buildable = true;
        };
      };
    }