build:
	./docker/docker-hugo.sh
	./docker/docker-gulp.sh

netlify:
	hugo && gulp

update-theme:
	git submodule update --remote --merge
