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
    flags = { release = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "urbit-hob"; version = "0.2.0"; };
      license = "MIT";
      copyright = "2019 Jared Tobin";
      maintainer = "jared@jtobin.io";
      author = "Jared Tobin";
      homepage = "https://github.com/urbit/urbit-hob";
      url = "";
      synopsis = "Hoon-style atom manipulation and printing functions";
      description = "Here you can primarily find functions for dealing with the \\\"patp\\\" phonetic\nbase used by Urbit.  The \\@p encoding is used for naming ships; it uniquely\nrepresents a 32-bit number in a memorable and pronounceable fashion.\n\nThe \\@p encoding is an /obfuscated/ representation of an underlying 32-bit\nnumber, in particular, hence the \\\"ob\\\" in the library's name.\n\nThe @Urbit.Ob@ module exposes two functions, 'patp' and 'fromPatp', for\nconverting between representations.  You can also render a 'Patp' value via\nthe 'render' function, or parse one via 'parse'.\n\nSome quick examples:\n\n>>> :set -XOverloadedStrings\n>>> import qualified Urbit.Ob as Ob\n>>>\n>>> let nidsut = Ob.patp 15663360\n>>> Ob.render nidsut\n\"~nidsut-tomdun\"\n>>> Ob.fromPatp nidsut\n15663360\n>>> Ob.parse \"~nidsut-tomdun\"\nRight ~nidsut-tomdun";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."murmur3" or (errorHandler.buildDepError "murmur3"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "ob" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."urbit-hob" or (errorHandler.buildDepError "urbit-hob"))
            ];
          buildable = true;
          };
        "co" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."urbit-hob" or (errorHandler.buildDepError "urbit-hob"))
            ];
          buildable = true;
          };
        };
      };
    }