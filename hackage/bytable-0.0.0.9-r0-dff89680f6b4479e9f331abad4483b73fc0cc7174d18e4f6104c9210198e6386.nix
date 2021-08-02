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
      identifier = { name = "bytable"; version = "0.0.0.9"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Yoshikuni Jujo <PAF01143@nifty.ne.jp>";
      author = "Yoshikuni Jujo <PAF01143@nifty.ne.jp>";
      homepage = "";
      url = "";
      synopsis = "data from/to ByteString";
      description = "You can read data from ByteString.\n\n> some = do\n>     x <- take 4\n>     y <- take 8\n>     return (x :: Int, y :: Integer)\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."word24" or (errorHandler.buildDepError "word24"))
          ];
        buildable = true;
        };
      };
    }