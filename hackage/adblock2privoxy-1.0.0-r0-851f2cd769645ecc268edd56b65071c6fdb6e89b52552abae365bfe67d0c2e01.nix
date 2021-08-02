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
      specVersion = "1.6";
      identifier = { name = "adblock2privoxy"; version = "1.0.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "Alexey Zubritsky";
      author = "Alexey Zubritsky";
      homepage = "https://projects.zubr.me/wiki/adblock2privoxy";
      url = "";
      synopsis = "Convert adblock config files to privoxy format";
      description = "AdBlock Plus browser plugin has great block list files provided by big community,\nbut it is client software and cannot work on a server as proxy.\n\nPrivoxy proxy has good potential to block ads at server side,\nbut it experiences acute shortage of updated block lists.\n\nThis software converts adblock lists to privoxy config files format.\n\nAlmost all adblock features are supported including\n- block/unblock requests (on privoxy)\nall syntax features are supported except for regex templates matching host name\n- hide/unhide page elements (via CSS)\nall syntax features are supported\n- all block request options except for outdated ones:\nSupported: script, image, stylesheet, object, xmlhttprequest, object-subrequest, subdocument,\ndocument, elemhide, other, popup, third-party, domain=..., match-case, donottrack\nUnsupported: collapse, background, xbl, ping and dtd";
      buildType = "Simple";
      };
    components = {
      exes = {
        "adblock2privoxy" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."MissingH" or (errorHandler.buildDepError "MissingH"))
            (hsPkgs."parsec-permutation" or (errorHandler.buildDepError "parsec-permutation"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
            (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
            ];
          buildable = true;
          };
        };
      };
    }