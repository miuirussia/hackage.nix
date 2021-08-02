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
      specVersion = "1.10";
      identifier = { name = "wallpaper"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2017 Jeffrey Rosenbluth";
      maintainer = "jeffrey.rosenbluth@gmail.com";
      author = "Jeffrey Rosenbluth";
      homepage = "https://github.com/githubuser/wallpaper#readme";
      url = "";
      synopsis = "A library and executable for creating\nwallpaper, frieze, and rosette patterns.";
      description = "@wallpaper@ provides the tools needed to make your own\nwallpapers, friezes and rosettes as described in Frank A.\nFarris's beuatiful book\n<http://press.princeton.edu/titles/10435.html Creating Symmetry>.\nFollowing Farris we use the\n<https://en.wikipedia.org/wiki/Domain_coloring domain coloring>\nalgorithm to create recipes that convert an arbitrary image\nto a pattern. For example, using the this image\n\n<<examples/rose_small.png>>\n\nWe can make\n\n<<examples/beach_morph.png>>\n\nFor maximum flexibily the @wallpaper@ library provides an\nEDSL for their creation,\nalternatively the @wallpaper@ and @rosette@ executables\ncan be used with a yaml file to create a large variety of\npatterns.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
        buildable = true;
        };
      exes = {
        "wallpaper" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wallpaper" or (errorHandler.buildDepError "wallpaper"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            ];
          buildable = true;
          };
        "rosette" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wallpaper" or (errorHandler.buildDepError "wallpaper"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            ];
          buildable = true;
          };
        };
      tests = {
        "wallpaper-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wallpaper" or (errorHandler.buildDepError "wallpaper"))
            ];
          buildable = true;
          };
        };
      };
    }