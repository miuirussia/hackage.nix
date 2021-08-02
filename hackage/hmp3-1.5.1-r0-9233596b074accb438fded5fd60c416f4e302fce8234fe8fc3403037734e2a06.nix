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
    flags = { small_base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "hmp3"; version = "1.5.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "dons@galois.com";
      author = "Don Stewart";
      homepage = "http://www.cse.unsw.edu.au/~dons/hmp3.html";
      url = "";
      synopsis = "An ncurses mp3 player written in Haskell";
      description = "An mp3 player with a curses frontend. Playlists are populated by\npassing directory names on the commandline, and saved to the\n~/.hmp3db database. Type 'h' to display the help page.  Colours may\nbe configured at runtime by editing the \"~/.hmp3\" file.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hmp3" = {
          depends = [
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."pcre-light" or (errorHandler.buildDepError "pcre-light"))
            (hsPkgs."mersenne-random" or (errorHandler.buildDepError "mersenne-random"))
            ] ++ (if flags.small_base
            then [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
              (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
              (hsPkgs."array" or (errorHandler.buildDepError "array"))
              (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
              (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
              (hsPkgs."process" or (errorHandler.buildDepError "process"))
              ]
            else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]);
          libs = [ (pkgs."curses" or (errorHandler.sysDepError "curses")) ];
          buildable = true;
          };
        };
      };
    }