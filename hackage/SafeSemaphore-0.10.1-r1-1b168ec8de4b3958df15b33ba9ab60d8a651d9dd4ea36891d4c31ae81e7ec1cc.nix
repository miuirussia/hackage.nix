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
      identifier = { name = "SafeSemaphore"; version = "0.10.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Chris Kuklewicz <haskell@list.mightyreason.com>";
      author = "Chris Kuklewicz <haskell@list.mightyreason.com>";
      homepage = "https://github.com/ChrisKuklewicz/SafeSemaphore";
      url = "";
      synopsis = "Much safer replacement for QSemN, QSem, and SampleVar";
      description = "This provides a much safer semaphore than the QSem, QSemN, SampleVar in base.\nThose base modules are not exception safe and can be broken by killThread.\nSee <https://github.com/ChrisKuklewicz/SafeSemaphore> for more details.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          ];
        buildable = true;
        };
      tests = {
        "TestSafeSemaphore" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."SafeSemaphore" or (errorHandler.buildDepError "SafeSemaphore"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      };
    }