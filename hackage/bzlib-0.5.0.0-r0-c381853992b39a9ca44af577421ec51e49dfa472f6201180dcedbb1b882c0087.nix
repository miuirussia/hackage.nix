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
    flags = { bytestring-in-base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "bzlib"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2006-2008 Duncan Coutts";
      maintainer = "Duncan Coutts <duncan@haskell.org>";
      author = "Duncan Coutts <duncan@haskell.org>";
      homepage = "";
      url = "";
      synopsis = "Compression and decompression in the bzip2 format";
      description = "This package provides a pure interface for compressing and\ndecompressing streams of data represented as lazy\n'ByteString's. It uses the bz2 C library so it has high\nperformance.\n\nIt provides a convenient high level api suitable for most\ntasks and for the few cases where more control is needed it\nprovides access to the full bzip2 feature set.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = if flags.bytestring-in-base
          then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
          else [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ];
        libs = (pkgs.lib).optional (!system.isWindows) (pkgs."bz2" or (errorHandler.sysDepError "bz2"));
        buildable = true;
        };
      };
    }