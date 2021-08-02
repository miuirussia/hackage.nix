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
      identifier = { name = "smallcaps"; version = "0.4"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "stefan.berthold@gmx.net";
      author = "Stefan Berthold";
      homepage = "";
      url = "";
      synopsis = "A library and a program for pre-processing LaTeX files";
      description = "smallcaps is a pre-processor library for LaTeX files.\nThe library comes with an executable that makes most\nfunctionality accessible through a command line interface.\nThe pre-processor formats sequences of uppercase letters\nwith TeX's @\\\\small@ macro or whatever you configure.\nUppercase letters at the beginning of sentences are not\nformatted. Other formatting conditions can be configured by\nthe user.\n\nThe executable can be configured through its command line\narguments as well as through TeX comments. In the default\nconfiguration, lesscase does not change the content of any\nmacro argument or environment (different from document).\nMore and less restrictive configuration profiles can be\nactivated and adapted. Configurations can be stored and\nrestored at any time, even while processing the input\nfile.\n\n[\"Text.SmallCaps\"]\nexports the main program as library.\n\n[\"Text.SmallCaps.Config\"]\nspecifies the default configuration values for\n\"Text.SmallCaps\".\n\n[\"Text.SmallCaps.TeXParser\"]\nparses 'Text' to a 'TeXElement' token stream.\n\n[\"Text.SmallCaps.TeXLaTeXParser\"]\nparses a 'TeXElement' token stream and produces a\n'LaTeXElement' token stream.\n\n[\"Text.SmallCaps.DocumentParser\"]\nreplaces uppercase letters in 'LaTeXElement' token\nstreams.\n\nA simple program can be defined as\n\n@\nimport Data.Default   ( def )\nimport SmallCaps      ( smallcaps )\nmain = smallcaps def\n@";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ];
        buildable = true;
        };
      exes = {
        "lesscase" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."smallcaps" or (errorHandler.buildDepError "smallcaps"))
            ];
          buildable = true;
          };
        };
      tests = {
        "texparser" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."smallcaps" or (errorHandler.buildDepError "smallcaps"))
            ];
          buildable = true;
          };
        "texlatexparser" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."smallcaps" or (errorHandler.buildDepError "smallcaps"))
            ];
          buildable = true;
          };
        "inputfiles" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."smallcaps" or (errorHandler.buildDepError "smallcaps"))
            ];
          buildable = true;
          };
        "configparser" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."smallcaps" or (errorHandler.buildDepError "smallcaps"))
            ];
          buildable = true;
          };
        "printableparser" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."smallcaps" or (errorHandler.buildDepError "smallcaps"))
            ];
          buildable = true;
          };
        "documentparser" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."smallcaps" or (errorHandler.buildDepError "smallcaps"))
            ];
          buildable = true;
          };
        };
      };
    }