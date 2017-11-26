FROM ubuntu:16.04

ENV LC_ALL="en_US.UTF-8"

RUN apt-get update && \
    apt-get install -y \
        python-dev \
        python-pip \
        python3-dev \
        python3-pip \
        curl \
        exuberant-ctags \
        libncurses-dev \
        git \
        shellcheck \
        locales \
        language-pack-en \
        perl \
        libperl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --upgrade pip \
    && pip install \
        pep8 \
        flake8 \
        pyflakes \
        autopep8

RUN git clone https://github.com/vim/vim.git \
    && cd vim/src \
    && export PYTHON2_SRCDIR="/usr/lib/python2.7/config-x86_64-linux-gnu" \
    && export PYTHON3_SRCDIR=$(python3 -c 'import sysconfig; print(sysconfig.get_config_vars("srcdir")[0])') \
    && ./configure \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --with-python-config-dir=$PYTHON2_SRCDIR \
    --enable-python3interp \
    --with-python3-config-dir=$PYTHON3_SRCDIR \
    --enable-cscope \
    --enable-gui=auto \
    --with-features=huge \
    --with-x \
    --enable-fontset \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="vind" \
    --enable-fail-if-missing \
    && make \
    && make install

RUN mkdir -p /vim/autoload /vim/bundle

ADD https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim /vim/autoload/pathogen.vim

RUN cd /vim/bundle \
    && git clone --depth 1 https://github.com/ConradIrwin/vim-bracketed-paste.git \
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
