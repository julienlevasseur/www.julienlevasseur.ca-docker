FROM alpine:latest

LABEL version="0.1"
LABEL description="www.julienlevasseur.ca website."
MAINTAINER Julien Levasseur

WORKDIR /opt/jekyll

RUN apk upgrade --update \
&& apk add libatomic readline readline-dev libxml2 libxml2-dev \
	ncurses-terminfo-base ncurses-terminfo libxslt libxslt-dev \
	zlib-dev zlib ruby ruby-dev yaml yaml-dev libffi-dev build-base \
	ruby-io-console ruby-irb ruby-json ruby-rake git \
&& gem install --no-document redcarpet kramdown maruku rdiscount \
	RedCloth liquid pygments.rb sass safe_yaml jekyll jekyll-paginate \
	jekyll-sass-converter jekyll-sitemap jekyll-feed jekyll-redirect-from \
	json bundler rake jekyll-seo-tag\
&& gem install --no-document rake -v 10.0 \
&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
&& apk del build-base zlib-dev ruby-dev readline-dev \
yaml-dev libffi-dev libxml2-dev \
&& apk search --update

EXPOSE 4000

RUN git clone https://github.com/julienlevasseur/jekyll-theme-basically-basic.git .
