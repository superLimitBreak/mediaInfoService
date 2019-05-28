# Docker Variables
CONTAINER_NAME=superlimitbreak/mediainfoservice
PATH_HOST_media=$(pwd)

# Local Variables
ENV=_env
PYTHON_VERSION=3
PYTHON=${ENV}/bin/python${PYTHON_VERSION}
PIP=${ENV}/bin/pip${PYTHON_VERSION}


# Docker -----------------------------------------------------------------------

.PHONY: build
build:
	docker build -t ${CONTAINER_NAME} .

.PHONY: push
push: build
	docker push ${CONTAINER_NAME}

.PHONY: run_docker
run_docker:
	docker run --rm -it \
		-p 8000:8000 \
		-v $$(PWD):/mediaInfoService/ \
		-v ${PATH_HOST_media}:${PATH_HOST_media} \
		-e PATH_HOST_media=${PATH_HOST_media} \
		--entrypoint /bin/sh \
		${CONTAINER_NAME}


# Local ------------------------------------------------------------------------

$(ENV):
	#python$(PYTHON_VERSION) -m virtualenv $(ENV)
	virtualenv -p python$(PYTHON_VERSION) $(ENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r mediaInfoService.pip

.PHONY: run
run: $(ENV)
	${PYTHON} mediaInfoService.py ./

.PHONY: clean
clean:
	rm -rf ${ENV}
