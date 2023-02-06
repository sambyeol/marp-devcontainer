# Devcontainer with Marp
Pre-installed [Marp](https://marp.app) for [devcontainer](https://code.visualstudio.com/docs/remote/containers).
You can find the images in [Docker Hub](https://hub.docker.com/r/sambyeol/marp-devcontainer).

## Quickstart
Make a devcontainer setting file at `.devcontainer/devcontainer.json` in your project.
```json
{
    "image": "sambyeol/marp-devcontainer",
    "customizations": {
        "vscode": {
            "extensions": [
                "marp-team.marp-vscode"
            ]
        }
    }
}
```
Then, reopen in container.

## Cross-compile Images
All images are cross-compiled with `docker-buildx`.
### Requirements
Some system libraries for emulation are needed.
```sh
$ sudo apt-get update
$ sudo apt-get install -y binfmt-support qemu qemu-user-static
```

### Compile
You can build images for `linux/amd64` and `linux/arm64` architectures with the following command.
```sh
$ docker buildx bake --push
```
