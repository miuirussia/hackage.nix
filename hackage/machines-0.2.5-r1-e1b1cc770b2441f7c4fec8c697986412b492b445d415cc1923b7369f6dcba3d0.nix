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
      identifier = { name = "machines"; version = "0.2.5"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2012 Edward A. Kmett";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett, Rúnar Bjarnason";
      homepage = "http://github.com/ekmett/machines/";
      url = "";
      synopsis = "Networked stream transducers";
      description = "Networked stream transducers\n\nRúnar Bjarnason's talk on machines can be downloaded from:\n<https://dl.dropbox.com/u/4588997/Machines.pdf>";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."free" or (errorHandler.buildDepError "free"))
          (hsPkgs."pointed" or (errorHandler.buildDepError "pointed"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."void" or (errorHandler.buildDepError "void"))
          ];
        buildable = true;
        };
      tests = {
        "doctests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            ];
          buildable = true;
          };
        };
      };
    }