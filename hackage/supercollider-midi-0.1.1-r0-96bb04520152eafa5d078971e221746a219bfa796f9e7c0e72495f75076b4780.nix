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
    flags = { splitbase = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "supercollider-midi"; version = "0.1.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "http://www.haskell.org/haskellwiki/SuperCollider";
      url = "http://darcs.haskell.org/supercollider-midi/";
      synopsis = "Demonstrate how to control SuperCollider via ALSA-MIDI";
      description = "Two small example programs where SuperCollider is controlled by MIDI.\n\n* Control parameters of a wind noise via MIDI controllers\n\n* Use UGens as instruments,\nwhich will be played upon MIDI messages that arrive through ALSA.\nThis way you can play MIDI files using @pmidi@\nor you can use your computer as MIDI expander controlled by a keyboard.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "sc-keyboard" = {
          depends = [
            (hsPkgs."supercollider-ht" or (errorHandler.buildDepError "supercollider-ht"))
            (hsPkgs."hsc3" or (errorHandler.buildDepError "hsc3"))
            (hsPkgs."hosc" or (errorHandler.buildDepError "hosc"))
            (hsPkgs."alsa-midi" or (errorHandler.buildDepError "alsa-midi"))
            (hsPkgs."midi" or (errorHandler.buildDepError "midi"))
            (hsPkgs."event-list" or (errorHandler.buildDepError "event-list"))
            (hsPkgs."non-negative" or (errorHandler.buildDepError "non-negative"))
            (hsPkgs."data-accessor" or (errorHandler.buildDepError "data-accessor"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ] ++ (if flags.splitbase
            then [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."array" or (errorHandler.buildDepError "array"))
              (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
              (hsPkgs."random" or (errorHandler.buildDepError "random"))
              ]
            else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]);
          buildable = true;
          };
        "sc-wind" = {
          depends = [
            (hsPkgs."hsc3" or (errorHandler.buildDepError "hsc3"))
            (hsPkgs."hosc" or (errorHandler.buildDepError "hosc"))
            (hsPkgs."alsa-midi" or (errorHandler.buildDepError "alsa-midi"))
            (hsPkgs."midi" or (errorHandler.buildDepError "midi"))
            (hsPkgs."event-list" or (errorHandler.buildDepError "event-list"))
            (hsPkgs."non-negative" or (errorHandler.buildDepError "non-negative"))
            ] ++ [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }