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
      specVersion = "1.0";
      identifier = { name = "HsSyck"; version = "0.42"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Audrey Tang, Gaal Yahas, 2005, 2006, 2007";
      maintainer = "audreyt@audreyt.org";
      author = "Audrey Tang";
      homepage = "";
      url = "";
      synopsis = "Fast, lightweight YAML loader and dumper";
      description = "This is a simple YAML ('Yet Another Markup Language') processor,\nused by the Pugs project for handling data serialization; this can be\nuseful for optimization and caching purposes.\n\nThis is an interface to the @syck@ C library for parsing and\ndumping YAML data. It lets you transform textual YAML data into an\nobject of type 'YamlNode', and vice versa, fast.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        buildable = true;
        };
      };
    }