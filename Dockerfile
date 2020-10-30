FROM alpine:3.12

ARG PY37=3.7.9
ARG PY38=3.8.6
ARG PY39=3.9.0
ARG APK_MIRROR=http://alpine.cs.nctu.edu.tw

RUN echo ${APK_MIRROR}/v3.12/main > /etc/apk/repositories
RUN echo ${APK_MIRROR}/v3.12/community >> /etc/apk/repositories
RUN apk update

# bash is required for pyenv script
RUN apk add \
    zsh bash less wget git \
    build-base patch \
    linux-headers

# packages for CPython
RUN apk add \
    bzip2-dev \
    readline-dev \
    openssl-dev \
    sqlite-dev \
    zlib-dev \
    libffi-dev

# packages for lxml
RUN apk add \
    libxml2-dev \
    libxslt-dev

# packages for Pillow
RUN apk add \
    freetype-dev \
    fribidi-dev \
    harfbuzz-dev \
    lcms2-dev \
    openjpeg-dev \
    tcl-dev \
    tiff-dev \
    tk-dev \
    libimagequant-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libxcb-dev

# pyenv and zsh settings
RUN sed -i 's/ash/zsh/' /etc/passwd
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"' >> ~/.zshrc
SHELL [ "/bin/zsh", "-c" ]

# install Python 3.7
RUN source ~/.zshrc && \
    pyenv install ${PY37} && \
    pyenv global ${PY37} && \
    pip install -U pip wheel

# install Python 3.8
RUN source ~/.zshrc && \
    pyenv install ${PY38} && \
    pyenv global ${PY38} && \
    pip install -U pip wheel

# install Python 3.9
RUN source ~/.zshrc && \
    pyenv install ${PY39} && \
    pyenv global ${PY39} && \
    pip install -U pip wheel

# switch 3.8 as default
RUN source ~/.zshrc && \
    pyenv global ${PY38}

CMD [ "/bin/zsh" ]
