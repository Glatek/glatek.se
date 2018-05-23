build:
	./docker/docker-hugo.sh
	./docker/docker-gulp.sh

update-theme:
	git submodule update --remote --merge
