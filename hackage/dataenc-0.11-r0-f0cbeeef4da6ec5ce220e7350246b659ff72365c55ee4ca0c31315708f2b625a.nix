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
    flags = { large_base = false; };
    package = {
      specVersion = "1.2";
      identifier = { name = "dataenc"; version = "0.11"; };
      license = "LicenseRef-LGPL";
      copyright = "Magnus Therning, 2007";
      maintainer = "magnus@therning.org";
      author = "Magnus Therning";
      homepage = "";
      url = "";
      synopsis = "Data encoding library";
      description = "Data encoding library currently providing Uuencode, Base64,\nBase64Url, Base32, Base32Hex, Base16, and Base85.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = if flags.large_base
          then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
          else [
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ];
        buildable = true;
        };
      };
    }