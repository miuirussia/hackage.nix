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
      specVersion = "1.0";
      identifier = { name = "ctemplate"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "";
      author = "Adam Langley <agl@imperialviolet.org>";
      homepage = "http://darcs.imperialviolet.org/ctemplate";
      url = "";
      synopsis = "Binding to the Google ctemplate library";
      description = "CTemplate is the library that Google uses to render most of their sites\n(including the www.google.com search). It's a simple templating system, but\nincludes many, easy to use, escaping functions.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        libs = [ (pkgs."ctemplate" or (errorHandler.sysDepError "ctemplate")) ];
        buildable = true;
        };
      };
    }