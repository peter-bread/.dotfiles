# vi: noexpandtab

.PHONY: local

IMAGE = dotfiles-dev

local:
	docker build -f Dockerfile.local -t $(IMAGE) .
	docker run --rm -it $(IMAGE)

# TODO: Target with a separate Dockerfile that will download and run latest
# install script from GitHub.
