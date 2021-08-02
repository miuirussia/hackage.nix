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
      identifier = { name = "country"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "2017 Andrew Martin";
      maintainer = "andrew.thaddeus@gmail.com";
      author = "Andrew Martin";
      homepage = "https://github.com/andrewthad/country#readme";
      url = "";
      synopsis = "Country data type and functions";
      description = "The `country` library provides a data type for dealing with\nthe set of countries as defined by ISO 3166. The representation\nis compact and is well-suited to use with vectors and\nprimitive arrays. Additionally, this library exports functions\nthat provide the following encodings and decodings:\n\n* ISO Alpha-2 (two-letter country code)\n\n* ISO Alpha-3 (three-letter country code)\n\n* ISO Numeric (three-digit country code)\n\n\nThe main differences between this library and `iso3166-country-codes` are:\n\n* it doesn't use an ADT to represent countries, instead it uses the country's three-digit country code.\n\n* it doesn't use `String` for encoding/decoding\n\n* it provides two-alpha and three-alpha country codes.\n\n* it provides `Prim` instances from the `primitive` package to allow types to be used in unboxed vectors/arrays.\n\n* BSD3 licence instead of LGPL\n\nPlease open up an issue on github if there is anything\nyou would like to see added.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."country" or (errorHandler.buildDepError "country"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."quickcheck-classes" or (errorHandler.buildDepError "quickcheck-classes"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }