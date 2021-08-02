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
      identifier = { name = "tagsoup"; version = "0.6"; };
      license = "BSD-3-Clause";
      copyright = "2006-8, Neil Mitchell";
      maintainer = "ndmitchell@gmail.com";
      author = "Neil Mitchell";
      homepage = "http://www-users.cs.york.ac.uk/~ndm/tagsoup/";
      url = "";
      synopsis = "Parsing and extracting information from (possibly malformed) HTML documents";
      description = "TagSoup is a library for extracting information out of unstructured HTML code,\nsometimes known as tag-soup. The HTML does not have to be well formed, or render\nproperly within any particular framework. This library is for situations where\nthe author of the HTML is not cooperating with the person trying to extract the\ninformation, but is also not trying to hide the information.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = if flags.splitbase
          then [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ]
          else [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ];
        buildable = true;
        };
      exes = { "tagsoup" = { buildable = true; }; };
      };
    }