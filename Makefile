build:
	./docker/docker-hugo.sh
	./docker/docker-gulp.sh

netlify:
	hugo && gulp docker/gulp/gulpfile.js

update-theme:
	git submodule update --remote --merge
