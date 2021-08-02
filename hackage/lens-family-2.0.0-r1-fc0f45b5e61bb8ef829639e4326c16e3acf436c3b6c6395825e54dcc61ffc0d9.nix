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
      identifier = { name = "lens-family"; version = "2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2012,2013,2014,2017,2018,2019 Russell O'Connor";
      maintainer = "Russell O'Connor <roconnor@theorem.ca>";
      author = "Russell O'Connor";
      homepage = "";
      url = "";
      synopsis = "Lens Families";
      description = "This package provides first class functional references in Van Laarhoven style supporting the following optics:\n\n* Lenses (view, over)\n\n* Traversals (toListOf, matching, over)\n\n* Setters (over)\n\n* Grates (zipWithOf, under, review)\n\n* Resetters (under)\n\n* Adapters (view, review)\n\n* Grids (toListOf, over / under, review)\n\n* Prisms (matching, over / under, review)\n\n* Getters (view)\n\n* Folders (toListOf)\n\n* Reviewers (review)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."lens-family-core" or (errorHandler.buildDepError "lens-family-core"))
          ];
        buildable = true;
        };
      };
    }