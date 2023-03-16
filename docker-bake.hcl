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
        MARP_VERSION = "2.4.0"
    }
}

target "alpine" {
    inherits = ["version", "alpine", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/marp-devcontainer:2.4.0-alpine",
        "ghcr.io/sambyeol/marp-devcontainer:2.4-alpine",
        "ghcr.io/sambyeol/marp-devcontainer:2-alpine",
        "ghcr.io/sambyeol/marp-devcontainer:alpine",

        "ghcr.io/sambyeol/marp-devcontainer:2.4.0",
        "ghcr.io/sambyeol/marp-devcontainer:2.4",
        "ghcr.io/sambyeol/marp-devcontainer:2",
        "ghcr.io/sambyeol/marp-devcontainer:latest",
    ]
}

target "debian" {
    inherits = ["version", "debian", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/marp-devcontainer:2.4.0-debian",
        "ghcr.io/sambyeol/marp-devcontainer:2.4-debian",
        "ghcr.io/sambyeol/marp-devcontainer:2-debian",
        "ghcr.io/sambyeol/marp-devcontainer:debian",
    ]
}
