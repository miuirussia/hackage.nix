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
      identifier = { name = "erd"; version = "0.2.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "jamslam@gmail.com";
      author = "Andrew Gallant";
      homepage = "https://github.com/BurntSushi/erd";
      url = "";
      synopsis = "An entity-relationship diagram generator from a plain text description.";
      description = "erd transforms a plain text description of a relational database schema to a\ngraphical representation of that schema. It is intended that the graph make\nuse of common conventions when depicting entity-relationship diagrams,\nincluding modeling the cardinality of relationships between entities.\n\nA quick example that transforms an `er` file to a PDF:\n\n> \$ curl 'https://raw.githubusercontent.com/BurntSushi/erd/master/examples/simple.er' > simple.er\n> \$ cat simple.er\n> # Entities are declared in '[' ... ']'. All attributes after the entity header\n> # up until the end of the file (or the next entity declaration) correspond\n> # to this entity.\n> [Person]\n> *name\n> height\n> weight\n> +birth_location_id\n>\n> [Location]\n> *id\n> city\n> state\n> country\n>\n> # Each relationship must be between exactly two entities, which need not\n> # be distinct. Each entity in the relationship has exactly one of four\n> # possible cardinalities:\n> #\n> # Cardinality    Syntax\n> # 0 or 1         0\n> # exactly 1      1\n> # 0 or more      *\n> # 1 or more      +\n> Person *--1 Location\n> \$ erd -i simple.er -o simple.pdf\n\nThe PDF should now contain a graph that looks like this:\n\n<<http://burntsushi.net/stuff/erd-example-simple.png>>\n\nSee the <https://github.com/BurntSushi/erd#readme README.md> file for more\nexamples and instructions on how to write ER files.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "erd" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."graphviz" or (errorHandler.buildDepError "graphviz"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."graphviz" or (errorHandler.buildDepError "graphviz"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
            ];
          buildable = true;
          };
        };
      };
    }