build:
	./docker/docker-hugo.sh
	./docker/docker-gulp.sh

netlify:
	hugo
	npx gulp --gulpfile docker/gulp/gulpfile.js --cwd $(PWD)

update-theme:
	git submodule update --remote --merge
