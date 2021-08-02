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
    flags = { example = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "ansi-terminal"; version = "0.7"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Roman Cheplyaka <roma@ro-che.info>";
      author = "Max Bolingbroke";
      homepage = "https://github.com/feuerbach/ansi-terminal";
      url = "";
      synopsis = "Simple ANSI terminal support, with Windows compatibility";
      description = "ANSI terminal support for Haskell: allows cursor movement, screen clearing, color output, showing or hiding the cursor, and\nchanging the title. Works on UNIX and Windows.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."colour" or (errorHandler.buildDepError "colour"))
          ] ++ (pkgs.lib).optionals (system.isWindows) [
          (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
          (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
        buildable = true;
        };
      exes = {
        "ansi-terminal-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            ] ++ (pkgs.lib).optionals (system.isWindows) [
            (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
            (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))
            ];
          buildable = if !flags.example then false else true;
          };
        };
      };
    }