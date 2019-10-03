self: super:

let
	dynamic-linker = super.stdenv.cc.bintools.dynamicLinker;

    patchelf = libPath: if self.stdenv.isDarwin
        then ""
        else ''
            chmod u+w $SPAGO
            patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" --set-rpath ${libPath} $SPAGO
            chmod u-w $SPAGO    
        '';

    patchelfPurs = libPath: if self.stdenv.isDarwin
        then ""
        else ''
            chmod u+w $PURS
            patchelf --interpreter ${dynamic-linker} --set-rpath ${libPath} $PURS
            chmod u-w $PURS    
        '';

in {
    purs-0_13_3 = super.stdenv.mkDerivation rec {
        name = "purescript";

        version = "v0.13.3";

        src = if self.stdenv.isDarwin
            then super.fetchurl {
				url = "https://github.com/purescript/purescript/releases/download/v0.13.3/macos.tar.gz";
				sha256 = "04ylhqadj7wnclhiar9il6fkrxmh9qkz6fpas7z3b37w4qg0gshl";
            }
            else super.fetchurl {
				url = "https://github.com/purescript/purescript/releases/download/v0.13.3/linux64.tar.gz";
				sha256 = "1xcn694qfql87pdjh09hhvfvpakzxb2hagss61vh9msqq3s96l3z";
            };

		buildInputs = [ self.zlib self.gmp self.ncurses5 ];

		libPath = super.lib.makeLibraryPath buildInputs;

		dontStrip = true;

		installPhase = ''
			mkdir -p $out/bin
			PURS="$out/bin/purs"

			install -D -m555 -T purs $PURS
			${patchelfPurs libPath}

			mkdir -p "$out/etc/bash_completion.d/"
			$PURS --bash-completion-script $PURS > $out/etc/bash_completion.d/purs-completion.bash
		'';
    };

    spago = super.stdenv.mkDerivation rec {
        name = "spago";

        version = "0.9.0.0";

        src = if self.stdenv.isDarwin
            then super.fetchurl {
                url = "https://github.com/spacchetti/spago/releases/download/0.9.0.0/osx.tar.gz";
                sha256 = "14k3ycqhc3m170s848kgyd3236z1p6yjsmj8aavwyqyi4dh2p97x";
            }
            else super.fetchurl {
                url = "https://github.com/spacchetti/spago/releases/download/0.9.0.0/linux.tar.gz";
                sha256 = "0rrpg1h1rdvfcxnldwni9kaqnv58cblfadgz7wamnggmnwsjnnzk";
            };

        buildInputs = [ self.gmp self.zlib self.ncurses5 ];

        libPath = super.lib.makeLibraryPath buildInputs;

        dontStrip = true;

        unpackPhase = ''
            mkdir -p $out/bin
            tar xf $src -C $out/bin

            SPAGO="$out/bin/spago"
            ${patchelf libPath}

            mkdir -p $out/etc/bash_completion.d/
            $SPAGO --bash-completion-script $SPAGO > $out/etc/bash_completion.d/spago-completion.bash
        '';

        dontInstall = true;
    };
}
