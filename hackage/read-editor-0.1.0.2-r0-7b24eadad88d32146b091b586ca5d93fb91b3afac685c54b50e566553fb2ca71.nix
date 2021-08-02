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
    flags = { examples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "read-editor"; version = "0.1.0.2"; };
      license = "MIT";
      copyright = "Copyright (c) 2015 Pedro Tacla Yamada";
      maintainer = "tacla.yamada@gmail.com";
      author = "Pedro Tacla Yamada";
      homepage = "https://github.com/yamadapc/haskell-read-editor";
      url = "";
      synopsis = "Opens a temporary file on the system's EDITOR and returns the resulting edits";
      description = "See <https://github.com/yamadapc/haskell-read-editor> for more information";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = (pkgs.lib).optionals (!(!flags.examples)) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."read-editor" or (errorHandler.buildDepError "read-editor"))
            ];
          buildable = if !flags.examples then false else true;
          };
        "example-with" = {
          depends = (pkgs.lib).optionals (!(!flags.examples)) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."read-editor" or (errorHandler.buildDepError "read-editor"))
            ];
          buildable = if !flags.examples then false else true;
          };
        };
      };
    }