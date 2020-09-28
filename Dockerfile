FROM node:12

RUN mkdir -p /home/node/api/node_modules && chown -R node:node /home

# Create app directory
WORKDIR /home/node/api

COPY package.json .

USER node

# Install app dependencies
RUN yarn --quiet

# Bundle app source
COPY --chown=node:node . .

EXPOSE 3333

CMD yarn dev:start
