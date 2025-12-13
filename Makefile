# vi: noexpandtab

.PHONY: default
default:
	@printf "%s\n" "'make' is not the entry point. Use './install -h' or 'make help' for instructions."

.PHONY: help
help:
	@printf "%s\n" "'make' is not the main entry point. You should use './install' normally."
	@printf "\n"
	@printf "%s\n" "This Makefile provides several explicit targets for convenience:"
	@printf "\n"
	@printf "  %s\n" "Install wrappers:"
	@printf "    - %-8s %s\n" "modules" "Run ./install with only the --modules option"
	@printf "\n"
	@printf "  %s\n" "Developer-only:"
	@printf "    - %-8s %s\n" "local" "Copy local dotfiles repo into a docker container."

# Install Wrappers #############################################################

.PHONY: modules
modules:
	@./install --modules

# Developer-only ###############################################################

IMAGE = dotfiles-dev

.PHONY: local
local:
	docker build -f Dockerfile.local -t $(IMAGE) .
	docker run --rm -it $(IMAGE)

# TODO: Target with a separate Dockerfile that will download and run latest
# install script from GitHub.
