FROM blang/latex
MAINTAINER Roman Decker <roman dot decker at gmail dot com>

ADD latexmk.pl /usr/bin/latexmk
RUN chmod +x /usr/bin/latexmk

ADD autobuild /usr/bin/autobuild
RUN chmod +x /usr/bin/autobuild

ENV TEXMFHOME /root/texmf
ADD cls /root/texmf

RUN texhash
RUN mktexlsr /root/texmf

VOLUME /latex
WORKDIR /latex
