#!/bin/bash
set -x
set -e

opam init -y
eval `opam config env`
echo 'eval `opam config env`' >> /home/vagrant/.profile

opam install -y ulex cmdliner ocamlgraph quickcheck async yojson cohttp base64 mparser

cd src
git clone https://github.com/frenetic-lang/frenetic
cd ..

opam pin add frenetic src/frenetic -n -k git

opam install -y frenetic
