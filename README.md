# Devcontainer with Marp
Pre-installed [Marp](https://marp.app) for [devcontainer](https://code.visualstudio.com/docs/remote/containers).
You can find the images in `ghcr.io/sambyeol/marp-devcontainer`.

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

## Tags
Tags are named by `<version>-<distribution>`.
* Images are tagged with its `marp-cli` version. For example, `latest` tags mean that the image is created with the latest version of `marp-cli`.
* There are various base OS distributions. available distributions are as follows:
  * `alpine`: latest Alpine (default)
  * `debian`: latest Debian
  * `ubuntu`: latest Ubuntu LTS

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
