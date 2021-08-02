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
      identifier = { name = "Hclip"; version = "3.0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jetho@gmx.de";
      author = "Jens Thomas";
      homepage = "https://github.com/jetho/Hclip";
      url = "";
      synopsis = "A small cross-platform library for reading and modifying the system clipboard.";
      description = "A small cross-platform library for reading and modifying the system clipboard.\n\nHclip works on Windows, Mac OS X and Linux (but see the requirements below!).\n\nRequirements:\n\n* Windows: No additional requirements.\n\n* Mac OS X: Requires the pbcopy and pbpaste commands, which ship with Mac OS X.\n\n* Linux: Requires xclip or xsel installed.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
          ] ++ (pkgs.lib).optional (system.isWindows) (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"));
        buildable = true;
        };
      tests = {
        "Tasty" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."Hclip" or (errorHandler.buildDepError "Hclip"))
            ];
          buildable = true;
          };
        };
      };
    }