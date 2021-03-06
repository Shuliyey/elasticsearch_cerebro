FROM elasticsearch:5
MAINTAINER z.ye@base2services.com

# Install supervisord
RUN apt-get update \
  && apt-get install -y wget supervisor apt-transport-https
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install cerebro
ENV CEREBRO_VERSION 0.5.0
RUN useradd -M -s /bin/false cerebro \
  && wget -qO /tmp/cerebro-$CEREBRO_VERSION.tgz "https://github.com/lmenezes/cerebro/releases/download/v$CEREBRO_VERSION/cerebro-$CEREBRO_VERSION.tgz" \
  && mkdir -p /usr/share/cerebro \
  && tar xvf /tmp/cerebro-$CEREBRO_VERSION.tgz -C /usr/share/cerebro \
  && ln -s /usr/share/cerebro/cerebro-$CEREBRO_VERSION /usr/share/cerebro/latest \
  && ln -s /usr/share/cerebro/latest /usr/share/cerebro/default \
  && chown -R cerebro:cerebro /usr/share/cerebro

# Clean up
RUN rm /tmp/cerebro-$CEREBRO_VERSION.tgz && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/supervisor

VOLUME ["/usr/share/elasticsearch/data", "/usr/share/elasticsearch/config", "/usr/share/cerebro/default/conf", "/etc/supervisor/conf.d"]

EXPOSE 9000 9200 9300

CMD ["/usr/bin/supervisord"]
