docker_img="starefossen/github-pages"
docker_port=4000

run:
	docker run -it --rm -v "${PWD}":/usr/src/app -p "${docker_port}:4000" ${docker_img}
