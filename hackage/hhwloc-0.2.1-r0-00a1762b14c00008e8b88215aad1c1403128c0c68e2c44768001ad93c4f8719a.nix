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
      specVersion = "1.24";
      identifier = { name = "hhwloc"; version = "0.2.1"; };
      license = "MIT";
      copyright = "2020 (c) Daniel Taskoff";
      maintainer = "daniel.taskoff@gmail.com";
      author = "Daniel Taskoff";
      homepage = "https://github.com/dtaskoff/hhwloc#readme";
      url = "";
      synopsis = "Bindings to https://www.open-mpi.org/projects/hwloc";
      description = "Please see the README on GitHub at <https://github.com/dtaskoff/hhwloc#readme>";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (errorHandler.setupDepError "base")))
        (hsPkgs.buildPackages.directory or (pkgs.buildPackages.directory or (errorHandler.setupDepError "directory")))
        ];
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      };
    }