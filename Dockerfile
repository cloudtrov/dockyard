FROM bluemeric/nodejs
ADD . /data
EXPOSE 9000
# Compass
RUN apt-get update
RUN apt-get install -q -y ruby ruby-dev rubygems-integration
RUN gem install sass
RUN gem install compass
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install --save
RUN npm install grunt-contrib-compass --save
RUN bower install --save --allow-root --force-latest --config.interactive=false
CMD ["grunt", "serve", "--force"]
