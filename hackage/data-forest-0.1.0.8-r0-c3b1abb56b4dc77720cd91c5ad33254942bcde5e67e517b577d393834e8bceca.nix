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
      identifier = { name = "data-forest"; version = "0.1.0.8"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Chris Martin <ch.martin@gmail.com>";
      author = "Chris Martin <ch.martin@gmail.com>";
      homepage = "https://github.com/chris-martin/data-forest";
      url = "";
      synopsis = "A simple multi-way tree data structure.";
      description = "In some contexts, forests (collections of zero\nor more trees) are more important than trees.\nThe /data-forest/ library provides a @Tree@\ntype much like the one from the popular\n/containers/ library, but it also provides a\n@Forest@ type with its own @Functor@ and\n@Foldable@ instances.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      tests = {
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-forest" or (errorHandler.buildDepError "data-forest"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            ];
          buildable = true;
          };
        };
      };
    }