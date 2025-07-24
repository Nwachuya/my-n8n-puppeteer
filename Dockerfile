FROM n8nio/n8n:latest

USER root

# Install Chromium and Puppeteer dependencies using Alpine apk package manager
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto \
    udev \
    bash \
    curl

# Set environment variables to use installed Chromium and skip Puppeteer's bundled download
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install Puppeteer npm package inside the container
RUN npm install puppeteer

# Switch back to node user (default for n8n)
USER node
