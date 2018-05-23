build:
	./docker-build.sh
	gulp

update-theme:
	git submodule update --remote --merge
