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
      identifier = { name = "dates"; version = "0.2.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "portnov84@rambler.ru";
      author = "IlyaPortnov";
      homepage = "http://redmine.iportnov.ru/projects/dates/";
      url = "";
      synopsis = "Small library for parsing different dates formats.";
      description = "This package allows to parse many different formats\nof dates. Both absolute and relative dates are supported.\nSupported date formats are:\n\n* DD.MM.YYYY\n\n* YYYY\\/MM\\/DD\n\n* `12 September 2012'\n\n* `today', `tomorrow', `yesterday'\n\n* `in 2 days', '3 weeks ago'\n\n4-digits years may be abbreviated (such as 12 for 2012).\nBoth 12-hour and 24-hour time formats are supported.\n\nUser-specified date formats are supported by\nData.Dates.Formats module.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-unicode-symbols" or (errorHandler.buildDepError "base-unicode-symbols"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          ];
        buildable = true;
        };
      };
    }