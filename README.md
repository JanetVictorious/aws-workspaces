# AWS Workspace Client

Run aws workspace client on any linux distro supporting `docker` or `nix`. Solution humbly taken from [mausch](https://gist.github.com/mausch/168d09d18e354c8e47981b8e44746af9).

## Run using docker

Run `make build-image` to build the ubuntu image and install aws workspace client.

Run `make run-docker-aws-workspaces` to run the image out of a container and launch the workspaces client.

## Run using nix

Make sure to install nix and configure for your environment (e.g. [arch installation](https://wiki.archlinux.org/title/Nix#Installation)).

To run using nix, execute `make run-nix-aws-workspaces`.

To remove collected packages run `make free-nix`.
