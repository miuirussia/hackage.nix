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
      identifier = { name = "eros-client"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2014, Peter Harpending.";
      maintainer = "Peter Harpending <pharpend2@gmail.com>";
      author = "Peter Harpending";
      homepage = "";
      url = "";
      synopsis = "A command-line interface to the eros library.";
      description = "This is a command-line interface to the\n<https://github.com/pharpend/eros eros library>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "erosc" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."eros" or (errorHandler.buildDepError "eros"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }