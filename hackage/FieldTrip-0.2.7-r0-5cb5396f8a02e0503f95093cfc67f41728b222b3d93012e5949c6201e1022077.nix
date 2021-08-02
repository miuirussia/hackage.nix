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
      identifier = { name = "FieldTrip"; version = "0.2.7"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2007-2008 by Conal Elliott and Andy Gill";
      maintainer = "conal@conal.net, andygill@ku.edu";
      author = "Conal Elliott and Andy Gill";
      homepage = "http://haskell.org/haskellwiki/FieldTrip";
      url = "http://code.haskell.org/FieldTrip";
      synopsis = "Functional 3D";
      description = "FieldTrip is a library for functional 3D geometry\n\nPlease see the project wiki page: <http://haskell.org/haskellwiki/FieldTrip>\n\n&#169; 2008 by Andy Gill and Conal Elliott; BSD3 license.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."OpenGL" or (errorHandler.buildDepError "OpenGL"))
          (hsPkgs."GLUT" or (errorHandler.buildDepError "GLUT"))
          (hsPkgs."TypeCompose" or (errorHandler.buildDepError "TypeCompose"))
          (hsPkgs."MemoTrie" or (errorHandler.buildDepError "MemoTrie"))
          (hsPkgs."vector-space" or (errorHandler.buildDepError "vector-space"))
          (hsPkgs."graphicsFormats" or (errorHandler.buildDepError "graphicsFormats"))
          ];
        buildable = true;
        };
      };
    }