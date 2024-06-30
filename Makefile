-include env.sh
export

tag = 1.0

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-image: ## Build docker image
	@set -eu && \
	docker build -t aws-workspaces:$(tag) .

run-docker-aws-workspaces: ## Run aws-workspaces using docker
	@set -eu && \
	xhost + && \
	exec /usr/bin/docker run -it --rm --name aws-workspaces \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "$(HOME)/.aws-workspaces":"/root/.local/share/Amazon Web Services" \
		-e DISPLAY=$(DISPLAY) \
		aws-workspaces:$(tag)

run-nix-aws-workspaces: ## Run aws-workspaces using nix
	@nix-shell -p aws-workspaces --run workspacesclient

free-nix: ## Free up disk from nix packages
	@nix-collect-garbage
