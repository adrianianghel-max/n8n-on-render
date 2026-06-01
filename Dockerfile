FROM n8nio/n8n:latest

# Install tini manually because Render environment does not include it
USER root
RUN apt-get update && apt-get install -y tini && apt-get clean

# Switch back to node user
USER node

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=parola_ta
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://placeholder.onrender.com/

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
