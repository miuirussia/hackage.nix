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
    flags = { yi = false; dyre = true; threaded = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "leksah"; version = "0.12.1.2"; };
      license = "LicenseRef-GPL";
      copyright = "2007-2011 Juergen Nicklisch-Franken, Hamish Mackenzie";
      maintainer = "maintainer@leksah.org";
      author = "Juergen Nicklisch-Franken, Hamish Mackenzie";
      homepage = "http://www.leksah.org";
      url = "http://code.haskell.org/leksah";
      synopsis = "Haskell IDE written in Haskell";
      description = "An Integrated Development Environment for Haskell written in Haskell.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."glib" or (errorHandler.buildDepError "glib"))
          (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
          (hsPkgs."gtksourceview2" or (errorHandler.buildDepError "gtksourceview2"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
          (hsPkgs."regex-base" or (errorHandler.buildDepError "regex-base"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."ltk" or (errorHandler.buildDepError "ltk"))
          (hsPkgs."binary-shared" or (errorHandler.buildDepError "binary-shared"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."hslogger" or (errorHandler.buildDepError "hslogger"))
          (hsPkgs."leksah-server" or (errorHandler.buildDepError "leksah-server"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
          (hsPkgs."enumerator" or (errorHandler.buildDepError "enumerator"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."gio" or (errorHandler.buildDepError "gio"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ] ++ (if system.isWindows
          then [ (hsPkgs."Win32" or (errorHandler.buildDepError "Win32")) ]
          else [
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ])) ++ (pkgs.lib).optional (system.isOsx) (hsPkgs."gtk-mac-integration" or (errorHandler.buildDepError "gtk-mac-integration"))) ++ (pkgs.lib).optional (flags.yi) (hsPkgs."yi" or (errorHandler.buildDepError "yi"))) ++ (pkgs.lib).optional (flags.yi && flags.dyre) (hsPkgs."dyre" or (errorHandler.buildDepError "dyre"));
        libs = (pkgs.lib).optional (system.isWindows) (pkgs."kernel32" or (errorHandler.sysDepError "kernel32"));
        buildable = true;
        };
      exes = {
        "leksah" = {
          depends = ((((if system.isWindows
            then [ (hsPkgs."Win32" or (errorHandler.buildDepError "Win32")) ]
            else [
              (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
              ]) ++ (pkgs.lib).optional (system.isOsx) (hsPkgs."gtk-mac-integration" or (errorHandler.buildDepError "gtk-mac-integration"))) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.0" && flags.yi) (hsPkgs."yi" or (errorHandler.buildDepError "yi"))) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.0" && flags.yi && flags.dyre) (hsPkgs."dyre" or (errorHandler.buildDepError "dyre"))) ++ (if compiler.isGhc && (compiler.version).lt "7.0"
            then [
              (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
              (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
              (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
              (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
              (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
              (hsPkgs."glib" or (errorHandler.buildDepError "glib"))
              (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
              (hsPkgs."gtksourceview2" or (errorHandler.buildDepError "gtksourceview2"))
              (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
              (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
              (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
              (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
              (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
              (hsPkgs."regex-base" or (errorHandler.buildDepError "regex-base"))
              (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
              (hsPkgs."array" or (errorHandler.buildDepError "array"))
              (hsPkgs."time" or (errorHandler.buildDepError "time"))
              (hsPkgs."ltk" or (errorHandler.buildDepError "ltk"))
              (hsPkgs."binary-shared" or (errorHandler.buildDepError "binary-shared"))
              (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
              (hsPkgs."hslogger" or (errorHandler.buildDepError "hslogger"))
              (hsPkgs."leksah-server" or (errorHandler.buildDepError "leksah-server"))
              (hsPkgs."network" or (errorHandler.buildDepError "network"))
              (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
              (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
              (hsPkgs."enumerator" or (errorHandler.buildDepError "enumerator"))
              (hsPkgs."text" or (errorHandler.buildDepError "text"))
              (hsPkgs."gio" or (errorHandler.buildDepError "gio"))
              (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
              (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
              ]
            else [
              (hsPkgs."leksah" or (errorHandler.buildDepError "leksah"))
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              ]);
          libs = (pkgs.lib).optional (system.isWindows) (pkgs."kernel32" or (errorHandler.sysDepError "kernel32"));
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."leksah" or (errorHandler.buildDepError "leksah"))
            ];
          buildable = true;
          };
        };
      };
    }