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
      identifier = { name = "gloss-raster-accelerate"; version = "2.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Trevor L. McDonell <trevor.mcdonell@gmail.com>";
      author = "Trevor L. McDonell";
      homepage = "";
      url = "";
      synopsis = "Parallel rendering of raster images using Accelerate";
      description = "Please see the README on GitHub at <https://github.com/tmcdonell/gloss-raster-accelerate#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."accelerate" or (errorHandler.buildDepError "accelerate"))
          (hsPkgs."colour-accelerate" or (errorHandler.buildDepError "colour-accelerate"))
          (hsPkgs."gloss" or (errorHandler.buildDepError "gloss"))
          (hsPkgs."gloss-accelerate" or (errorHandler.buildDepError "gloss-accelerate"))
          ];
        buildable = true;
        };
      };
    }