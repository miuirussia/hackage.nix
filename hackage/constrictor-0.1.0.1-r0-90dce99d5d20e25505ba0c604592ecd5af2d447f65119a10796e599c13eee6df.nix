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
      identifier = { name = "constrictor"; version = "0.1.0.1"; };
      license = "MIT";
      copyright = "2018 (c) chessai ";
      maintainer = "chessai1996@gmail.com";
      author = "chessai";
      homepage = "https://github.com/chessai/constrictor.git";
      url = "";
      synopsis = "strict versions of many things in base";
      description = "strict versions of many functions in base,\nincluding some functions not present, such\nas foldlMapA/M, foldrMapA/M.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }