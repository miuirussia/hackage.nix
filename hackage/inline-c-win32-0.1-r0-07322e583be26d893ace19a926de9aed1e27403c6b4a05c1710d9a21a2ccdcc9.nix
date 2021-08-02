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
      specVersion = "1.12";
      identifier = { name = "inline-c-win32"; version = "0.1"; };
      license = "MIT";
      copyright = "Anton Dessiatov,";
      maintainer = "anton.dessiatov@gmail.com";
      author = "Anton Dessiatov";
      homepage = "https://github.com/anton-dessiatov/inline-c-win32";
      url = "";
      synopsis = "Win32 API Context for the inline-c library";
      description = "This is a little helper for the marvelous inline-c library. It provides a context with Win32 API\ndata types so you can use DWORD, BOOL, UINT and other Win32 data types right in your inlined\nfunction types.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."inline-c" or (errorHandler.buildDepError "inline-c"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))
          ];
        buildable = true;
        };
      };
    }