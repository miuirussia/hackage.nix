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
      identifier = { name = "io-throttle"; version = "0.1.0"; };
      license = "MIT";
      copyright = "(c) 2014, Rodrigo Setti";
      maintainer = "rodrigosetti@gmail.com";
      author = "Rodrigo Setti";
      homepage = "http://github.com/rodrigosetti/io-throttle";
      url = "";
      synopsis = "Limit number of IO actions started per second";
      description = "Limit the number of tasks started per second. The throttle function will\nrun all actions concurrently but only starting a certain number per\nsecond. It will wait for all tasks and return the results in a list.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."threads" or (errorHandler.buildDepError "threads"))
          (hsPkgs."SafeSemaphore" or (errorHandler.buildDepError "SafeSemaphore"))
          ];
        buildable = true;
        };
      tests = {
        "test-io-threads" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."io-throttle" or (errorHandler.buildDepError "io-throttle"))
            ];
          buildable = true;
          };
        };
      };
    }