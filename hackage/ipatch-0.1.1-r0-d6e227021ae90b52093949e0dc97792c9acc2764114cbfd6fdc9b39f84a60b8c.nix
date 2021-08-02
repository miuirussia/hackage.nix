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
    flags = { darcs-beta = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "ipatch"; version = "0.1.1"; };
      license = "GPL-2.0-only";
      copyright = "2010 Joachim Breitner ";
      maintainer = "mail@joachim-breitner.de";
      author = "Joachim Breitner";
      homepage = "http://darcs.nomeata.de/ipatch";
      url = "";
      synopsis = "interactive patch editor";
      description = "ipatch brings the power and convenience of selecting and editing patches in\nDarcs to those who are not using the Darcs version control system.\n\nIt allows the user to interactively split a patch file into several patch\nfile, as well as applying a patch interactively and possibly partially.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "ipatch" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."hashed-storage" or (errorHandler.buildDepError "hashed-storage"))
            ] ++ (if flags.darcs-beta
            then [
              (hsPkgs."darcs-beta" or (errorHandler.buildDepError "darcs-beta"))
              ]
            else [ (hsPkgs."darcs" or (errorHandler.buildDepError "darcs")) ]);
          buildable = true;
          };
        };
      };
    }