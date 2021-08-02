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
    flags = { debug = false; };
    package = {
      specVersion = "1.20";
      identifier = { name = "pandoc-vimhl"; version = "0.1.3.0"; };
      license = "BSD-3-Clause";
      copyright = "2016-2019 Alexey Radkov";
      maintainer = "Alexey Radkov <alexey.radkov@gmail.com>";
      author = "Alexey Radkov <alexey.radkov@gmail.com>";
      homepage = "http://github.com/lyokha/vim-publish-helper";
      url = "";
      synopsis = "Pandoc filter for native Vim code highlighting";
      description = "Pandoc filter for native Vim code highlighting\nin HTML and PDF documents. Requires Vim and plugin\n<http://github.com/lyokha/vim-publish-helper vim-publish-helper>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "vimhl" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
            (hsPkgs."cond" or (errorHandler.buildDepError "cond"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }