FROM ubuntu

RUN apt-get -y update ; \
    apt-get -y upgrade ; \
    apt-get install -y apt-utils wget git sudo ; \
    apt-get install -y adduser libfontconfig1 curl dirmngr apt-transport-https lsb-release ca-certificates;

EXPOSE 3000

RUN wget https://dl.grafana.com/oss/release/grafana_7.1.3_amd64.deb ; \
    dpkg -i grafana_7.1.3_amd64.deb ;

WORKDIR /var/lib/grafana/plugins

RUN git clone https://github.com/xDany1/prubea.git ; \
    cd /var/lib/grafana/plugins/prubea ; 
    
ENV GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

CMD grafana-server -homepath /usr/share/grafana ;
