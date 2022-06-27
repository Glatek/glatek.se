FROM cibuilds/hugo AS hugo
USER www-data
COPY --chown=www-data:www-data . /site
ENV HUGO_ENV=production
WORKDIR /site
RUN hugo

FROM node:17-alpine AS gulp
WORKDIR /app

ADD package.json package.json
RUN npm install

COPY --from=hugo /site/public ./public

ADD ./docker/gulp/gulpfile.js ./gulpfile.js
RUN npx gulp

FROM denoland/deno:distroless-1.23.1

WORKDIR /public
EXPOSE 4507

COPY --from=gulp /app/public/sv .

RUN ["deno", "cache", "https://deno.land/std@0.145.0/http/file_server.ts"]

CMD ["run", "--allow-net", "--allow-read", "https://deno.land/std@0.145.0/http/file_server.ts"]
