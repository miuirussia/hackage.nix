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
    flags = { new-base = false; };
    package = {
      specVersion = "1.2";
      identifier = { name = "curl"; version = "1.3.6"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sigbjorn Finne <sigbjorn.finne@gmail.com>";
      author = "Sigbjorn Finne";
      homepage = "";
      url = "";
      synopsis = "Haskell binding to libcurl";
      description = "libcurl is a client-side URL transfer library, supporting FTP, FTPS, HTTP,\nHTTPS, SCP, SFTP, TFTP, TELNET, DICT, LDAP, LDAPS and FILE.\nlibcurl supports SSL certificates, HTTP POST, HTTP PUT, FTP uploading,\nHTTP form based upload, proxies, cookies, user+password authentication\n(Basic, Digest, NTLM, Negotiate, Kerberos4), file transfer resume,\nhttp proxy tunneling and more!\n\nThis package provides a Haskell binding to libcurl.";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ] ++ (if flags.new-base
          then [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ]
          else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]);
        libs = [ (pkgs."curl" or (errorHandler.sysDepError "curl")) ];
        buildable = true;
        };
      };
    }