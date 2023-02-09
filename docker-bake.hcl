group "default" {
    targets = [
        "2_3_0_alpine",
        "2_3_0_debian",
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

// built at 2023-02-06

target "2_3_0" {
    args = {
        MARP_VERSION = "2.3.0"
    }
}

target "2_3_0_alpine" {
    inherits = ["2_3_0", "alpine", "cross_platform"]
    tags = [
        "sambyeol/marp-devcontainer:2.3.0-alpine",
        "sambyeol/marp-devcontainer:2.3-alpine",
        "sambyeol/marp-devcontainer:2-alpine",
        "sambyeol/marp-devcontainer:alpine",

        "sambyeol/marp-devcontainer:2.3.0",
        "sambyeol/marp-devcontainer:2.3",
        "sambyeol/marp-devcontainer:2",
        "sambyeol/marp-devcontainer:latest",
    ]
}

target "2_3_0_debian" {
    inherits = ["2_3_0", "debian", "cross_platform"]
    tags = [
        "sambyeol/marp-devcontainer:2.3.0-debian",
        "sambyeol/marp-devcontainer:2.3-debian",
        "sambyeol/marp-devcontainer:2-debian",
        "sambyeol/marp-devcontainer:debian",
    ]
}
