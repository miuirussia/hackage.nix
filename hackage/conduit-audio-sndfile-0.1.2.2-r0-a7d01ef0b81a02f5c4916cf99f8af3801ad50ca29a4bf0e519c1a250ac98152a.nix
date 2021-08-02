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
      identifier = { name = "conduit-audio-sndfile"; version = "0.1.2.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "miketolly@gmail.com";
      author = "Michael Tolly";
      homepage = "http://github.com/mtolly/conduit-audio";
      url = "";
      synopsis = "conduit-audio interface to the libsndfile audio file library";
      description = "A wrapper around @hsndfile@ (binding to the @libsndfile@ library)\nfor use with @conduit-audio@, to load a wide variety of audio files as streams.\n\n@libsndfile@ is LGPL licensed, so you may dynamically link to it from a closed-source program.\nHowever, note that @hsndfile@ is also LGPL licensed,\nso if your program is closed-source you also must dynamically link @hsndfile@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-audio" or (errorHandler.buildDepError "conduit-audio"))
          (hsPkgs."hsndfile" or (errorHandler.buildDepError "hsndfile"))
          (hsPkgs."hsndfile-vector" or (errorHandler.buildDepError "hsndfile-vector"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }