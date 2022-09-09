#!/bin/bash

# Fail on any error.
set -e 

cd "~"
git clone --depth 1 "https://github.com/tensorflow/tensorflow.git"

docker pull "tensorflow/build:latest-python3.9"

mkdir "${KOKORO_ARTIFICATS_DIR}/github/kokoro-codelab-halseycamilla/packages"
mkdir "${KOKORO_ARTIFICATS_DIR}/github/kokoro-codelab-halseycamilla/bazelcache"

docker run --name tf -w /tf/tensorflow -it -d \
  -v "/kokoro-codelab-halseycamilla/packages:/tf/pkg" \
  -v "/kokoro-codelab-halseycamilla/tensorflow:/tf/tensorflow" \
  -v "/kokoro-codelab-halseycamilla/bazelcache:/tf/cache" \
  tensorflow/build:latest-python3.9 \
  bash
