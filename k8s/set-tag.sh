#!/usr/bin/env sh
set -eu

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <tag>"
  echo "Example: $0 a1b2c3d4"
  exit 1
fi

TAG="$1"
FILE="k8s/kustomization.yaml"

awk -v tag="$TAG" '
  $0 ~ "name: registry.infraejobs.ro/infra/gaz/calculatorgaz" { print; getline; sub(/newTag: .*/, "newTag: \"" tag "\""); print; next }
  { print }
' "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE"

echo "Updated calculatorgaz to tag $TAG in $FILE"
