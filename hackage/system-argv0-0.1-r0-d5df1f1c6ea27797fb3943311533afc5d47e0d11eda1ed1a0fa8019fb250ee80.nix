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
      identifier = { name = "system-argv0"; version = "0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "John Millikin <jmillikin@gmail.com>";
      author = "John Millikin <jmillikin@gmail.com>";
      homepage = "https://john-millikin.com/software/hs-argv0/";
      url = "";
      synopsis = "Get @argv[0]@ as a FilePath.";
      description = "Get @argv[0]@ as a FilePath. This is how the program was invoked, and might\nnot correspond to any actual file.\n\nUse this instead of @System.Environment.getProgName@ if you want the full\npath, and not just the last component.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."system-filepath" or (errorHandler.buildDepError "system-filepath"))
          ];
        buildable = true;
        };
      };
    }