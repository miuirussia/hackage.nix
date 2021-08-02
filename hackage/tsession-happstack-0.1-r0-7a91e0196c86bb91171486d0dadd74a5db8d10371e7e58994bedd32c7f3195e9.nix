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
      identifier = { name = "tsession-happstack"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "2014 Florian Micheler";
      maintainer = "Florian Micheler <hackage@micheler.net>";
      author = "Florian Micheler <hackage@micheler.net>";
      homepage = "";
      url = "";
      synopsis = "A Transaction Framework for Happstack         ";
      description = "This is the integration of tsession to Happstack\n\nFor more information check my master thesis:\n\n<http://stud.micheler.net/master.pdf>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."happstack-server" or (errorHandler.buildDepError "happstack-server"))
          (hsPkgs."tsession" or (errorHandler.buildDepError "tsession"))
          ];
        buildable = true;
        };
      };
    }