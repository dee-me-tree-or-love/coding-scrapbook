# Use these attributes to configure your jupyter Docker image and container.
LOCAL_DOCKER_IMAGE_TAG=local-jupyter
LOCAL_JUPYTER_PORT=8888
LOCAL_CONTAINER_NAME=${LOCAL_DOCKER_IMAGE_TAG}-runner
WORKSPACE_DIR=./workspace

# terminal-agnostic way to find current path.
CURRENT_DIR=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Starts the jupyter notebook
.PHONY: run-jupyter
run-jupyter run-j: build ${WORKSPACE_DIR} run-jupyter-no-build

# Builds the jupyter docker image
.PHONY: build
build:
	@echo "💡 Starting a Docker build for local image: ${LOCAL_DOCKER_IMAGE_TAG}"
	@echo "This might take a few minutes, please hold on..."
	docker build -t ${LOCAL_DOCKER_IMAGE_TAG} . && echo "✅ Done."

${WORKSPACE_DIR}:
	mkdir -p ${WORKSPACE_DIR}

.PHONY: run-jupyter-no-build
run-jupyter-no-build run-j-nb:
	@echo "👋 Starting the local jupyter notebook: ${LOCAL_DOCKER_IMAGE_TAG}"
	@echo "Using the local port: ${LOCAL_JUPYTER_PORT}"
	@echo "Once ready, use the Jupyter Server at http://127.0.0.1:${LOCAL_JUPYTER_PORT}"
	@echo "💡 Look up the link in the log outputs below to access the Jupyter space."
	@echo "All your notebooks in '${WORKSPACE_DIR}' directory are synced with the server."
	@echo "💡 To stop the server simply terminate this process."
	@echo "~~~"
	docker run \
		--rm \
		--name ${LOCAL_CONTAINER_NAME} \
		-p ${LOCAL_JUPYTER_PORT}:8888 \
		-v "${CURRENT_DIR}${WORKSPACE_DIR}":/home/jovyan/work \
		${LOCAL_DOCKER_IMAGE_TAG}

.PHONY: stop-jupyter
stop-jupyter stop-j stop:
	@echo "💡 Stopping the server..."
	docker stop ${LOCAL_CONTAINER_NAME} && @echo "✅ Done."