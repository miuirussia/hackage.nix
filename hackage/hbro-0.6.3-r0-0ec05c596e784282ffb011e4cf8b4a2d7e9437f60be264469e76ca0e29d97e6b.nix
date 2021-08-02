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
      specVersion = "1.8";
      identifier = { name = "hbro"; version = "0.6.3"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "koral at mailoo dot org";
      author = "koral";
      homepage = "http://projects.haskell.org/hbro/";
      url = "";
      synopsis = "A suckless minimal KISSy browser";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."dyre" or (errorHandler.buildDepError "dyre"))
          (hsPkgs."glib" or (errorHandler.buildDepError "glib"))
          (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."pango" or (errorHandler.buildDepError "pango"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."url" or (errorHandler.buildDepError "url"))
          (hsPkgs."webkit" or (errorHandler.buildDepError "webkit"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."zeromq-haskell" or (errorHandler.buildDepError "zeromq-haskell"))
          ];
        buildable = true;
        };
      exes = {
        "hbro" = {
          depends = [
            (hsPkgs."hbro" or (errorHandler.buildDepError "hbro"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."glib" or (errorHandler.buildDepError "glib"))
            (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."pango" or (errorHandler.buildDepError "pango"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."webkit" or (errorHandler.buildDepError "webkit"))
            ];
          buildable = true;
          };
        };
      };
    }