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
    flags = { build-examples = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "termbox-banana"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2018-2019, Mitchell Rosen";
      maintainer = "Mitchell Rosen <mitchellwrosen@gmail.com>";
      author = "Mitchell Rosen";
      homepage = "https://github.com/mitchellwrosen/termbox-banana";
      url = "";
      synopsis = "reactive-banana + termbox";
      description = "A @reactive-banana@-based interface to writing @termbox@ programs.\n\nSee also the <https://hackage.haskell.org/termbox termbox> package for a\nlower-level, imperative interface.\n\n__/NOTE/__: The dependencies listed on Hackage are misleading! Most are only\nused in the examples provided, which are built only if the @build-examples@\nflag is explicitly enabled.\n\nThe actual dependencies of the @termbox-banana@ library are only:\n\n* base\n* reactive-banana\n* termbox";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."reactive-banana" or (errorHandler.buildDepError "reactive-banana"))
          (hsPkgs."termbox" or (errorHandler.buildDepError "termbox"))
          ];
        buildable = true;
        };
      exes = {
        "termbox-banana-example-echo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."reactive-banana" or (errorHandler.buildDepError "reactive-banana"))
            (hsPkgs."termbox-banana" or (errorHandler.buildDepError "termbox-banana"))
            ];
          buildable = if !flags.build-examples then false else true;
          };
        "termbox-banana-example-hoogle" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lens-aeson" or (errorHandler.buildDepError "lens-aeson"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."reactive-banana" or (errorHandler.buildDepError "reactive-banana"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."tagsoup" or (errorHandler.buildDepError "tagsoup"))
            (hsPkgs."termbox-banana" or (errorHandler.buildDepError "termbox-banana"))
            ];
          buildable = if !flags.build-examples then false else true;
          };
        };
      };
    }