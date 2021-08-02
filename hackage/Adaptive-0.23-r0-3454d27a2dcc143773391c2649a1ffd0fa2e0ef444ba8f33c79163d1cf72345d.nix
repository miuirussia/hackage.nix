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
      identifier = { name = "Adaptive"; version = "0.23"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Magnus Carlsson <magnus@carlssonia.org>";
      author = "Magnus Carlsson";
      homepage = "";
      url = "";
      synopsis = "Library for incremental computing.";
      description = "This is a Haskell (plus some extensions) implementation\nof a library for incremental computing.  It closely\nfollows the implementation in the nice POPL 2002 paper\n\"Adaptive Functional Programming\", by Umut Acar,\nGuy Blelloch and Bob Harper.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      exes = { "spreadsheet" = { buildable = true; }; };
      };
    }