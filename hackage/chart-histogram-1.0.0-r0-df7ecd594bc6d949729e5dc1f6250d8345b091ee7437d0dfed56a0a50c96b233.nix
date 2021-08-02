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
      identifier = { name = "chart-histogram"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2014 Ben Gamari";
      maintainer = "bgamari.foss@gmail.com";
      author = "Ben Gamari";
      homepage = "";
      url = "";
      synopsis = "Easily render histograms with Chart";
      description = "A library for rendering histograms with the Chart library\nWarning: This package has been merged into @Chart@ and is deprecated.\nThe module exported here is nothing more than a re-export of the\n\"Graphics.Rendering.Chart.Plot.Histogram\" module from @Chart@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Chart" or (errorHandler.buildDepError "Chart"))
          ];
        buildable = true;
        };
      };
    }