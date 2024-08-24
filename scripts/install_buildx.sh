#!/bin/sh -l

# Register Arm executables
docker run --rm --privileged tonistiigi/binfmt --install all
# Register Multiarch executables
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

# Create builder instance
docker buildx create --name actions_builder --use
SUPPORTED_PLATFORMS=$(docker buildx inspect --bootstrap | grep 'Platforms:*.*' | cut -d : -f2,3)
echo "Supported platforms: $SUPPORTED_PLATFORMS"
