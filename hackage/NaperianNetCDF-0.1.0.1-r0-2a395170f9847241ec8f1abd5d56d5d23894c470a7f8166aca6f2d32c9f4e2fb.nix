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
      specVersion = "2.4";
      identifier = { name = "NaperianNetCDF"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Dominic Steinitz";
      maintainer = "dominic@steinitz.org";
      author = "Dominic Steinitz";
      homepage = "";
      url = "";
      synopsis = "Instances of NcStore for hypercuboids";
      description = "This allows [NetCDF](https://en.wikipedia.org/wiki/NetCDF) data to be read and written into [hypercuboids](http://www.cs.ox.ac.uk/people/jeremy.gibbons/publications/apl-extabs.pdf) e.g. values with type @Hyper '[Vector 5, Vector 2, Vector 3] Int@ such as @\\<\\<\\<1,2,3,4,5>, \\<6,7,8,9,10>>, \\<\\<11,12,13,14,15>, \\<16,17,18,19,20>>, \\<\\<21,22,23,24,25>, \\<26,27,28,29,30>>>@";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Naperian" or (errorHandler.buildDepError "Naperian"))
          (hsPkgs."hnetcdf" or (errorHandler.buildDepError "hnetcdf"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "Main" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Naperian" or (errorHandler.buildDepError "Naperian"))
            (hsPkgs."hnetcdf" or (errorHandler.buildDepError "hnetcdf"))
            (hsPkgs."NaperianNetCDF" or (errorHandler.buildDepError "NaperianNetCDF"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            ];
          buildable = true;
          };
        };
      };
    }