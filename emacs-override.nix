with (import <nixpkgs> {});

{
  emacs-28 = (emacs-nox.overrideAttrs (old : {
    pname = "emacs";
    version = "head";
    src = fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      rev = "044dd1e21028fad3cf8d976dae887503dbab6ae3";
      #rev = "4d439744685b6b2492685124994120ebd1fa4abb";
      #sha256 = "00vxb83571r39r0dbzkr9agjfmqs929lhq9rwf8akvqghc412apf";
      sha256 = "1s3arbkzwbip8fn56439qf7ic864wyshprx0h0lsn7hh6dndd26q";
    };
    patches = [];
    configureFlags = old.configureFlags ++ ["--with-json"];
    preConfigure = "./autogen.sh";
    buildInputs = old.buildInputs ++ [ autoconf texinfo ];
  })).override {
    nativeComp = true;
  };

  emacs-28-nox = (emacs-nox.overrideAttrs (old : {
    pname = "emacs-nox";
    version = "head";
    src = fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      rev = "044dd1e21028fad3cf8d976dae887503dbab6ae3";
      #rev = "4d439744685b6b2492685124994120ebd1fa4abb";
      #sha256 = "00vxb83571r39r0dbzkr9agjfmqs929lhq9rwf8akvqghc412apf";
      sha256 = "1s3arbkzwbip8fn56439qf7ic864wyshprx0h0lsn7hh6dndd26q";
    };
    patches = [];
    configureFlags = old.configureFlags ++ ["--with-json"];
    preConfigure = "./autogen.sh";
    buildInputs = old.buildInputs ++ [ autoconf texinfo ];
  })).override {
    nativeComp = true;
  };
}
