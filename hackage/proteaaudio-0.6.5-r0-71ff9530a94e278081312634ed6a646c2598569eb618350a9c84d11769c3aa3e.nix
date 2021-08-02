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
      specVersion = "1.10";
      identifier = { name = "proteaaudio"; version = "0.6.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "csaba.hruska@gmail.com";
      author = "Csaba Hruska";
      homepage = "";
      url = "";
      synopsis = "Simple audio library for Windows, Linux, OSX.";
      description = "Simple audio library for Windows, Linux, OSX. Supports Ogg and Wav playback and multichannel mixing.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        libs = ((pkgs.lib).optionals (system.isWindows) [
          (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
          (pkgs."ole32" or (errorHandler.sysDepError "ole32"))
          (pkgs."dsound" or (errorHandler.sysDepError "dsound"))
          (pkgs."winmm" or (errorHandler.sysDepError "winmm"))
          ] ++ (pkgs.lib).optionals (system.isLinux) [
          (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
          (pkgs."pthread" or (errorHandler.sysDepError "pthread"))
          (pkgs."asound" or (errorHandler.sysDepError "asound"))
          ]) ++ (pkgs.lib).optionals (system.isOsx) [
          (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
          (pkgs."pthread" or (errorHandler.sysDepError "pthread"))
          ];
        frameworks = (pkgs.lib).optionals (system.isOsx) [
          (pkgs."CoreFoundation" or (errorHandler.sysDepError "CoreFoundation"))
          (pkgs."CoreAudio" or (errorHandler.sysDepError "CoreAudio"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs.components.exes.c2hs or (pkgs.buildPackages.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          ];
        buildable = true;
        };
      exes = {
        "proteaaudio-play" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."proteaaudio" or (errorHandler.buildDepError "proteaaudio"))
            ];
          buildable = if flags.example then true else false;
          };
        };
      };
    }