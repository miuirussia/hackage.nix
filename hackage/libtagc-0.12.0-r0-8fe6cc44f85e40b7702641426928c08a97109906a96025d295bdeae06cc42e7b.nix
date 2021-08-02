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
      identifier = { name = "libtagc"; version = "0.12.0"; };
      license = "LGPL-2.1-only";
      copyright = "(c) 2010 Andy Stewart";
      maintainer = "gtk2hs-users@sourceforge.net";
      author = "Andy Stewart";
      homepage = "https://patch-tag.com/r/AndyStewart/libtagc/home";
      url = "";
      synopsis = "Binding to TagLib C library.";
      description = "TagLib is a library for reading and editing the meta-data of several popular audio formats.\nCurrently it supports both ID3v1 and ID3v2 for MP3 files, Ogg Vorbis comments and ID3 tags\nand Vorbis comments in FLAC, MPC, Speex, WavPack and TrueAudio files.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."glib" or (errorHandler.buildDepError "glib"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        libs = [ (pkgs."tag_c" or (errorHandler.sysDepError "tag_c")) ];
        pkgconfig = [
          (pkgconfPkgs."taglib_c" or (errorHandler.pkgConfDepError "taglib_c"))
          ];
        buildable = true;
        };
      };
    }