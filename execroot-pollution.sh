#!/bin/bash
# Add this file to the .bazelignore
THIS_FILE=$(basename "$0")
EXECROOT=bazel-$(basename "$(pwd)")

echo "${THIS_FILE}" >> .bazelignore

# Run the build target for the protobufs
bazel build //src:weather

echo "Contents of .bazelignore"
cat .bazelignore

echo "Content of the execroot directory"
tree -L 1 "${EXECROOT}" 

if [ -f "${EXECROOT}/${THIS_FILE}" ]; then
    echo "File ${THIS_FILE} exists"
else
    echo "File ${THIS_FILE} doesnt exists"
fi
