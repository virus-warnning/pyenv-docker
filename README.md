# pyenv-docker

Alpine build.

```
docker build -t pyenv-alpine:3.12 .
docker run --name pyenv1 -it pyenv-alpine:3.12
docker start -i pyenv1
docker rm pyenv1
docker rmi pyenv-alpine:3.12
```

# installation tests

Version | Result
---- | ----
3.8.6 | passed
miniconda3-4.7.12 | failed
pypy3.6-7.3.1 | failed
stackless-3.7.5 | passed

# requirements of binding packages

python

* linux-headers
* bzip2-dev
* readline-dev
* openssl-dev
* sqlite-dev 
* zlib-dev
* libffi-dev

lxml

* libxml2-dev
* libxslt-dev

pillow

https://pillow.readthedocs.io/en/latest/installation.html#external-libraries

* freetype-dev 
* fribibi-dev
* harfbuzz-dev
* lcms2-dev 
* openjpeg-dev
* tcl-dev  
* tiff-dev 
* tk-dev
* libimagequant-dev 
* libjpeg-turbo-dev 
* libwebp-dev 
* libxcb-dev
