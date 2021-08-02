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
      specVersion = "2.2";
      identifier = { name = "bytestring-substring"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "© 2019 Andrew Martin";
      maintainer = "Andrew Martin <andrew.thaddeus@gmail.com>\nchessai <chessai1996@gmail.com>";
      author = "Andrew Martin";
      homepage = "https://github.com/chessai/bytestring-substring";
      url = "";
      synopsis = "break bytestrings up into substrings";
      description = "break bytestrings up into substrings,\nuses karprabin. support for pipes included";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          ];
        buildable = true;
        };
      };
    }