FROM debian:10.3

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update -y && DEBIAN_FRONTEND="noninteractive" TZ="America/New_York"  apt-get install -y apt-utils && apt-get install -y curl  &&  apt-get install -y \
        texlive-fonts-recommended \
        texlive-generic-recommended \
        texlive-latex-extra \
        texlive-fonts-extra \
        dvipng \
        texlive-latex-recommended \
        texlive-base \
        texlive-pictures \
        texlive-lang-cyrillic \
        texlive-science \
        cm-super \
        texlive-generic-extra \
        tzdata    

COPY main.tex main.tex

CMD [ "pdflatex", "-interaction=nonstopmode", " main.tex" ]
