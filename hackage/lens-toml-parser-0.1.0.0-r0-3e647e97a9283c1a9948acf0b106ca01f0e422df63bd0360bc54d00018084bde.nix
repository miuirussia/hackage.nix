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
      identifier = { name = "lens-toml-parser"; version = "0.1.0.0"; };
      license = "ISC";
      copyright = "Copyright (c) 2017, Henry Till";
      maintainer = "henrytill@gmail.com";
      author = "Henry Till";
      homepage = "https://github.com/xngns/lens-toml-parser";
      url = "";
      synopsis = "Lenses for toml-parser";
      description = "Lenses for toml-parser";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."toml-parser" or (errorHandler.buildDepError "toml-parser"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."dwergaz" or (errorHandler.buildDepError "dwergaz"))
            (hsPkgs."toml-parser" or (errorHandler.buildDepError "toml-parser"))
            (hsPkgs."lens-simple" or (errorHandler.buildDepError "lens-simple"))
            (hsPkgs."lens-toml-parser" or (errorHandler.buildDepError "lens-toml-parser"))
            ];
          buildable = true;
          };
        "hlint" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hlint" or (errorHandler.buildDepError "hlint"))
            ];
          buildable = true;
          };
        };
      };
    }