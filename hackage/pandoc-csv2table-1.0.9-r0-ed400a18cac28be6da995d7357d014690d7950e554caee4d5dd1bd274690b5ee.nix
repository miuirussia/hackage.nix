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
      identifier = { name = "pandoc-csv2table"; version = "1.0.9"; };
      license = "MIT";
      copyright = "(c) 2015-2021 Wasif Hasan Baig, Venkateswara Rao Mandela";
      maintainer = "Venkateswara Rao Mandela <venkat.mandela@gmail.com>";
      author = "Wasif Hasan Baig <pr.wasif@gmail.com>";
      homepage = "https://github.com/baig/pandoc-csv2table-filter";
      url = "";
      synopsis = "Convert CSV to Pandoc Table Markdown";
      description = "A Pandoc filter that replaces image inline or fenced code\nblocks with pandoc table markdown. CSV contents will be\nparsed by the pandoc markdown reader.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."csv" or (errorHandler.buildDepError "csv"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."pandoc" or (errorHandler.buildDepError "pandoc"))
          (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
          ];
        buildable = true;
        };
      exes = {
        "pandoc-csv2table" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."csv" or (errorHandler.buildDepError "csv"))
            (hsPkgs."pandoc" or (errorHandler.buildDepError "pandoc"))
            (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
            (hsPkgs."pandoc-csv2table" or (errorHandler.buildDepError "pandoc-csv2table"))
            ];
          buildable = true;
          };
        };
      };
    }