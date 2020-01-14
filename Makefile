docker_image="starefossen/github-pages"
docker_port=4000
entry_port=4000
docker_path="/usr/src/app"
entry_path="${PWD}"

run:
	docker run -it --rm -v ${entry_path}:${docker_path} -p "${entry_port}:${docker_port}" ${docker_image}
