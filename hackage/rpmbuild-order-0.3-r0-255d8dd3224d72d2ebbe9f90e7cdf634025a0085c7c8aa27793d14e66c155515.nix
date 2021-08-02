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
      identifier = { name = "rpmbuild-order"; version = "0.3"; };
      license = "BSD-3-Clause";
      copyright = "2010-2018  Henning Thielemann,\n2018-2019 Jens Petersen <petersen@redhat.com>";
      maintainer = "Jens Petersen <petersen@redhat.com>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "https://github.com/juhp/rpmbuild-order";
      url = "";
      synopsis = "Order RPM packages by dependencies";
      description = "The rpmbuild-order tool orders RPM packages by dependencies, so that they can\nbe built in the correct order. It does this by reading RPM package spec files\nand then topologically sorts them according to their dependencies.\nThe code originates from cabal-sort by Henning Thielemann.\nIt can also output the ordered dependencies or reverse depends\nfor one or more packages, provided all the packages are checked out\nin neighboring directories. This is also useful to see what packages\nare affected when a low-level package changes.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "rpmbuild-order" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."fgl" or (errorHandler.buildDepError "fgl"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."simple-cmd-args" or (errorHandler.buildDepError "simple-cmd-args"))
            ];
          buildable = true;
          };
        };
      };
    }