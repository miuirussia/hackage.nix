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
      specVersion = "1.8";
      identifier = { name = "reinterpret-cast"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2014 Niklas Hambüchen <mail@nh2.me>";
      maintainer = "Niklas Hambüchen <mail@nh2.me>";
      author = "Niklas Hambüchen <mail@nh2.me>";
      homepage = "https://github.com/nh2/reinterpret-cast";
      url = "";
      synopsis = "Memory reinterpretation casts for Float/Double and Word32/Word64";
      description = "Memory reinterpretation casts for Float\\/Double and Word32\\/Word64.\n\nThe implementations in the @.Internal@ package are different ways to tackle\nthe problem; the @array@ method (current default) is about 5 times faster\nthan the @FFI@ method.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."reinterpret-cast" or (errorHandler.buildDepError "reinterpret-cast"))
            (hsPkgs."data-binary-ieee754" or (errorHandler.buildDepError "data-binary-ieee754"))
            (hsPkgs."loop" or (errorHandler.buildDepError "loop"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."reinterpret-cast" or (errorHandler.buildDepError "reinterpret-cast"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."data-binary-ieee754" or (errorHandler.buildDepError "data-binary-ieee754"))
            ];
          buildable = true;
          };
        };
      };
    }