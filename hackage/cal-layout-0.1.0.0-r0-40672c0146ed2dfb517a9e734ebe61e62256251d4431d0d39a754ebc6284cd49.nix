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
      identifier = { name = "cal-layout"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2019 Boro Sitnikovski";
      maintainer = "buritomath@gmail.com";
      author = "Boro Sitnikovski";
      homepage = "https://github.com/bor0/cal-layout";
      url = "";
      synopsis = "Calendar Layout Algorithm";
      description = "This project demonstrates calculation of\ndimensions and positions for a list of\nevents in a given calendar.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "bookings-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cal-layout" or (errorHandler.buildDepError "cal-layout"))
            ];
          buildable = true;
          };
        };
      };
    }