FROM ubuntu:latest
USER root
RUN apt-get update && \
      apt-get -y install locales && \
      locale-gen en_US.utf8 && \
      apt-get -y install sudo && \
      useradd -ms /bin/bash vagrant && \
      echo "vagrant ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/vagrant && \
      chmod 0440 /etc/sudoers.d/vagrant
RUN mkdir /vagrant
WORKDIR /vagrant
COPY --chown=vagrant:vagrant . .
USER vagrant
RUN bash bin/provisionall.sh
EXPOSE 80 5432
CMD sudo service nginx restart && \
      sudo service postgresql restart && \
      . ~/dbpass.sh && \
      PORT=3000 pm2 start -n api node -- api/src/server.js && \
      echo "Playpen Started" && \
      bash