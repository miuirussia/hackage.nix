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
      identifier = { name = "data-rope"; version = "0.3"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Pierre-Etienne Meunier <pierreetienne.meunier@gmail.com>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "Ropes, an alternative to (Byte)Strings.";
      description = "Ropes : an alternative to Strings,\na time and space-efficient representation of character\nstrings.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring-mmap" or (errorHandler.buildDepError "bytestring-mmap"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
        buildable = true;
        };
      };
    }