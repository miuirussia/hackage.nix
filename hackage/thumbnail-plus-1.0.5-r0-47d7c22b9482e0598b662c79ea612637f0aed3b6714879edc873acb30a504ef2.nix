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
      identifier = { name = "thumbnail-plus"; version = "1.0.5"; };
      license = "MIT";
      copyright = "(c) 2014 Prowdsponsor";
      maintainer = "Felipe Lessa <felipe.lessa@gmail.com>";
      author = "Felipe Lessa, Michael Snoyman";
      homepage = "https://github.com/prowdsponsor/thumbnail-plus";
      url = "";
      synopsis = "Generate thumbnails easily and safely.";
      description = "This package provides every tool you need to easily and safely\ngenerate thumbnails for JPG, GIF and PNG images.\n\nBy safely, we mean that this package should be able to handle\nimages uploaded to a public web server without any known\nvulnerabilities:\n\n* File sizes are constrained and checked.\n\n* Image sizes are constrained and checked before the images\nare loaded into memory.  Uses @imagesize-conduit@ by Michael\nSnoyman.\n\n* Optionally, the original image is reencoded before being\nsaved.\n\n* The images are processed using the <http://libgd.bitbucket.org/ GD library>,\nwhich is heavily battle-tested and\n<http://www.cvedetails.com/vulnerability-list/vendor_id-2678/Gd-Graphics-Library.html audited by many pairs of eyeballs>.\n\nPlease report any vulnerabilities you may find, we take strive\nto make this library suitable for processing arbitrary images.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."either" or (errorHandler.buildDepError "either"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."imagesize-conduit" or (errorHandler.buildDepError "imagesize-conduit"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."gd" or (errorHandler.buildDepError "gd"))
          ];
        buildable = true;
        };
      tests = {
        "runtests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."thumbnail-plus" or (errorHandler.buildDepError "thumbnail-plus"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }