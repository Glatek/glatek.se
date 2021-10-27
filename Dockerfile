FROM cibuilds/hugo AS hugo
WORKDIR /src
ADD . .
ENV HUGO_ENV=production
CMD ["hugo"]

FROM node:17-alpine AS gulp
WORKDIR /app
ADD package.json package.json
RUN npm install
ADD ./docker/gulp/gulpfile.js ./gulpfile.js
COPY --from=hugo /src/public ./public
RUN npx gulp
RUN ls -la ./public

FROM denoland/deno:distroless-1.15.3

WORKDIR /public
EXPOSE 4507

COPY --from=gulp /app/public/sv .

RUN ["deno", "cache", "https://deno.land/std@0.106.0/http/file_server.ts"]

CMD ["run", "--allow-net", "--allow-read", "https://deno.land/std@0.106.0/http/file_server.ts"]
