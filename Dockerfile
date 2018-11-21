# ================================================================================
# Compile elixir app as a separate stage
FROM elixir:1.7.2-alpine AS application

# RUN apt-get update && apt-get install -y build-essential
RUN apk --update upgrade && apk add --no-cache build-base git nodejs nodejs-npm
RUN mix local.hex --force && mix local.rebar --force
RUN mkdir -p /dockup-demo
WORKDIR /dockup-demo
COPY mix.exs .
COPY mix.lock .
RUN mix deps.get --force --only prod
COPY . ./
COPY ./config/prod.secret.example.exs \
     config/prod.secret.exs

# setup staticassets
RUN mkdir -p /dockup-demo/assets
WORKDIR /dockup-demo/assets
COPY ./assets/package*.json ./
RUN npm install
COPY ./assets .
RUN npm run deploy

# continue with phoenix
WORKDIR /dockup-demo
ENV MIX_ENV prod
RUN mix deps.get --only prod && \
    mix phx.digest && \
    mix release --env prod

# ================================================================================
# Start from alpine and copy binaries
FROM alpine
MAINTAINER Codemancers <team@codemancers.com>

RUN apk add --no-cache bash libssl1.0 git openssh
COPY --from=application /dockup-demo/_build /dockup-demo/_build
COPY --from=application /dockup-demo/scripts /dockup-demo/scripts

ENV MIX_ENV prod
ENV PORT 4000

EXPOSE 4000
CMD /dockup-demo/scripts/run_release
