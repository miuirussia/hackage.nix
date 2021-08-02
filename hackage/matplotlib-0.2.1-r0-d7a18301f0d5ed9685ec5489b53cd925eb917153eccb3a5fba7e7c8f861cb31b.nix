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
      identifier = { name = "matplotlib"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "2017 Andrei Barbu";
      maintainer = "andrei@0xab.com";
      author = "Andrei Barbu";
      homepage = "https://github.com/abarbu/matplotlib-haskell";
      url = "";
      synopsis = "Bindings to Matplotlib; a Python plotting library";
      description = "Matplotlib is probably the most full featured plotting library out there.\nThese bindings provide a quick, easy, and extensible way to use it in\nHaskell.\n\n<<https://github.com/abarbu/matplotlib-haskell/raw/master/imgs/contour.png>>\n\n> onscreen \$ contourF (\\a b -> sin (degreesRadians a) + cos (degreesRadians b)) (-100) 100 (-200) 200 10";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      tests = {
        "matplotlib-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."matplotlib" or (errorHandler.buildDepError "matplotlib"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            ];
          buildable = true;
          };
        };
      };
    }