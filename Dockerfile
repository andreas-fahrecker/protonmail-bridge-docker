FROM debian:buster

WORKDIR /opt/protonmail

# Copy bash scripts
COPY gpgparams install.sh entrypoint.sh VERSION /protonmail/

# Install dependencies and protonmail bridge
RUN bash install.sh

ENTRYPOINT ["bash", "/opt/protonmail/entrypoint.sh"]

EXPOSE 25/tcp
EXPOSE 143/tcp