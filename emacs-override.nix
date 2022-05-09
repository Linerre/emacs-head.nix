with (import <nixpkgs> {});

{
  emacs-28 = (emacs.overrideAttrs (old : {
    pname = "emacs";
    # with version remaining head, this is indeed v-29
    version = "head";
    src = fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      rev = "d8a47823103da803b8274d790527f48d85a3f9b4";
      #rev = "4d439744685b6b2492685124994120ebd1fa4abb";
      #sha256 = "00vxb83571r39r0dbzkr9agjfmqs929lhq9rwf8akvqghc412apf";
      sha256 = "sha256-bVeTVA95/G4MN653EOP0plR7E0KQJil5HKWfDwawVMU=";
    };
    patches = [];
    configureFlags = old.configureFlags ++ ["--with-json"];
    preConfigure = "./autogen.sh";
    buildInputs = old.buildInputs ++ [ autoconf texinfo ];
  })).override {
    nativeComp = true;
  };
}
