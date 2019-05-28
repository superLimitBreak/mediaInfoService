CONTAINER_NAME=superLimitBreak/mediaInfoService
PATH_HOST_media=$(pwd)

build:
	docker build -t ${CONTAINER_NAME} .

push: build
	docker push ${CONTAINER_NAME}

run:
	docker run --rm -it \
		-p 8000:8000 \
		-v $$(PWD):/mediaInfoService/ \
		-v ${PATH_HOST_media}:${PATH_HOST_media} \
		-e PATH_HOST_media=${PATH_HOST_media} \
		--entrypoint /bin/sh \
		${CONTAINER_NAME}
