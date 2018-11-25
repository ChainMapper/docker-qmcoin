FROM chainmapper/walletbase-xenial
	
ENV WALLET_URL=https://github.com/project-qmc/QMC/releases/download/v1.1.2/linux_cli.tar.xz

RUN wget $WALLET_URL -O /tmp/wallet.tar.xz \
	&& cd /usr/local/bin \
	&& tar xvf /tmp/wallet.tar.xz \
	&& rm /tmp/wallet.tar.xz

#rpc port & mainport
EXPOSE 6666 28443

RUN mkdir /data
ENV HOME /data

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
COPY wallet.sh /wallet.sh
RUN chmod 777 /*.sh
CMD /start.sh qmc.conf QMC qmcd