MACHINE := $(shell uname -m)

all: build

build:
	docker build -t "${USER}-vim" -f Dockerfile.${MACHINE}.vim .

.PHONY: all build
