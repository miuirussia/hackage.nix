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
      identifier = { name = "Win32"; version = "2.5.2.0"; };
      license = "BSD-3-Clause";
      copyright = "Alastair Reid, 1999-2003; shelarcy, 2012-2013";
      maintainer = "Haskell Libraries <libraries@haskell.org>";
      author = "Alastair Reid, shelarcy";
      homepage = "https://github.com/haskell/win32";
      url = "";
      synopsis = "A binding to part of the Win32 library";
      description = "A binding to part of the Win32 library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ];
        libs = [
          (pkgs."user32" or (errorHandler.sysDepError "user32"))
          (pkgs."gdi32" or (errorHandler.sysDepError "gdi32"))
          (pkgs."winmm" or (errorHandler.sysDepError "winmm"))
          (pkgs."advapi32" or (errorHandler.sysDepError "advapi32"))
          (pkgs."shell32" or (errorHandler.sysDepError "shell32"))
          (pkgs."shfolder" or (errorHandler.sysDepError "shfolder"))
          (pkgs."shlwapi" or (errorHandler.sysDepError "shlwapi"))
          (pkgs."msimg32" or (errorHandler.sysDepError "msimg32"))
          (pkgs."imm32" or (errorHandler.sysDepError "imm32"))
          (pkgs."ntdll" or (errorHandler.sysDepError "ntdll"))
          ];
        buildable = true;
        };
      };
    }