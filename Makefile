all: build

build:
	docker build -t "${USER}-vim" -f Dockerfile.vim .

.PHONY: all build
