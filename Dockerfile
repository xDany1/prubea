FROM ubuntu

RUN apt-get -y update ; \
    apt-get -y upgrade ; \
    apt-get install -y apt-utils wget git sudo ; \
    apt-get -y install adduser libfontconfig1 curl dirmngr apt-transport-https lsb-release ca-certificates;

EXPOSE 3000

RUN wget https://dl.grafana.com/oss/release/grafana_7.1.3_amd64.deb ; \
    dpkg -i grafana_7.1.3_amd64.deb ;

WORKDIR /var/lib/grafana/plugins

RUN git clone https://github.com/xDany1/prubea.git ; \
    cd /var/lib/grafana/plugins/prubea ;

CMD /etc/init.d/grafana-server start 'daemon off;' && bash
