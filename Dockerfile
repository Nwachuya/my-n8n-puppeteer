

FROM n8nio/n8n:latest

# Install Chromium dependencies using apk (Alpine package manager)
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      font-noto \
      udev \
      dumpkeys \
      bash \
      curl \
      && rm -rf /var/cache/apk/*

# Install Puppeteer
RUN npm install puppeteer
