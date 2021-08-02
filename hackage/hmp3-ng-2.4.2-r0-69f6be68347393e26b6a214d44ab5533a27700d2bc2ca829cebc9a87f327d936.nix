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
      identifier = { name = "hmp3-ng"; version = "2.4.2"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Galen Huntington";
      author = "Don Stewart, Galen Huntington";
      homepage = "https://github.com/galenhuntington/hmp3-ng";
      url = "";
      synopsis = "A 2019 fork of an ncurses mp3 player written in Haskell";
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
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            (hsPkgs."hscurses" or (errorHandler.buildDepError "hscurses"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ];
          libs = [ (pkgs."curses" or (errorHandler.sysDepError "curses")) ];
          buildable = true;
          };
        };
      };
    }