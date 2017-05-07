FROM ubuntu:16.04

ENV LC_ALL="en_US.UTF-8"

RUN apt-get update && \
    apt-get install -y \
        python-dev \
        python-pip \
        python3-dev \
        python3-pip \
        curl \
        vim \
        exuberant-ctags \
        git \
        shellcheck \
        locales \
        language-pack-en \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --upgrade pip \
    && pip install \
        pep8 \
        flake8 \
        pyflakes \
        autopep8

RUN mkdir -p /vim/autoload /vim/bundle

ADD https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim /vim/autoload/pathogen.vim

RUN cd /vim/bundle \
    && git clone --depth 1 https://github.com/scrooloose/nerdtree.git \
    && git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git \
    && git clone --depth 1 https://github.com/vim-airline/vim-airline.git \
    && git clone --depth 1 https://github.com/vim-airline/vim-airline-themes.git \
    && git clone --depth 1 https://github.com/ntpeters/vim-better-whitespace.git \
    && git clone --depth 1 https://github.com/tpope/vim-fugitive.git \
    && git clone --depth 1 https://github.com/mhinz/vim-signify.git \
    && git clone --depth 1 https://github.com/vim-syntastic/syntastic.git \
    && git clone --depth 1 https://github.com/tell-k/vim-autopep8.git \
    && git clone --depth 1 --recursive https://github.com/davidhalter/jedi-vim.git \
    && git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim


ADD https://raw.githubusercontent.com/vim-scripts/moria/master/colors/moria.vim /vim/colors/moria.vim

COPY vim-context /vim/

RUN chmod -R 755 /vim

ENTRYPOINT [ "/vim/entrypoint.sh" ]
