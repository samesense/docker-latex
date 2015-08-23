Docker-Container for simple LaTeX-Builds
========================================

This container aims to provide a simple way to build LaTeX documents out of the
box. You can basically perform any compilation task using this image, although a
simple script is provided to perform pdflatex + bibtex build.

Usage
-----

##### Docker OS X install
* brew cask install virtualbox
* brew install docker boot2docker
* boot2docker up
* eval "$(boot2docker shellinit)"
* docker pull samesense/docker-latex or clone this repo, and "docker build -t docker-latex ." from repo dir

The container expects your LaTeX-documents mounted at `/latex`, so if you want build from your cwd, simply run:

    docker run --rm -v `pwd`:/latex samesense/latex autobuild yourfile.tex

Which will compile your tex-file to a PDF-Document, including BibTex support.

Adding additional cls-files
-----------------------------

`TEXMFHOME` is located at `/root/texmf` within the container. Simply put your
files there (in the correct hierarchy). And re-run `texhash` and `mktexlsr
/root/texmf` so that LaTeX will find them.
