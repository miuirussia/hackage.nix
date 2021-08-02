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
    flags = { use-maps = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "GraphSCC"; version = "1.0.4"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "diatchki@galois.com";
      author = "Iavor S. Diatchki";
      homepage = "";
      url = "";
      synopsis = "Tarjan's algorithm for computing the strongly connected components of a graph.";
      description = "Tarjan's algorithm for computing the strongly connected components of a graph.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      };
    }