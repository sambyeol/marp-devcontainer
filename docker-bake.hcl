group "default" {
    targets = [
        "alpine",
        "debian",
    ]
}

target "cross_platform" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "debian" {
    dockerfile = "./dockerfiles/debian.dockerfile"
}

target "alpine" {
    dockerfile = "./dockerfiles/alpine.dockerfile"
}

target "version" {
    args = {
        MARP_VERSION = "3.1.0"
    }
}

target "alpine" {
    inherits = ["version", "alpine", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/marp-devcontainer:3.1.0-alpine",
        "ghcr.io/sambyeol/marp-devcontainer:3.1-alpine",
        "ghcr.io/sambyeol/marp-devcontainer:3-alpine",
        "ghcr.io/sambyeol/marp-devcontainer:alpine",

        "ghcr.io/sambyeol/marp-devcontainer:3.1.0",
        "ghcr.io/sambyeol/marp-devcontainer:3.1",
        "ghcr.io/sambyeol/marp-devcontainer:3",
        "ghcr.io/sambyeol/marp-devcontainer:latest",
    ]
}

target "debian" {
    inherits = ["version", "debian", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/marp-devcontainer:3.1.0-debian",
        "ghcr.io/sambyeol/marp-devcontainer:3.1-debian",
        "ghcr.io/sambyeol/marp-devcontainer:3-debian",
        "ghcr.io/sambyeol/marp-devcontainer:debian",
    ]
}
