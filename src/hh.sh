#!/bin/bash

MODULES=(
  "BKCore"
  "BKData"
  "BKDesign"
  "BKDomain"
  "BKNetwork"
  "BKPresentation"
  "BKStorage"
  "Booket"
)

for MODULE in "${MODULES[@]}"; do
  mkdir -p "Projects/$MODULE/Sources"
  mkdir -p "Projects/$MODULE/Resources"
  mkdir -p "Projects/$MODULE/Tests"
  
  PLACEHOLDER="Projects/$MODULE/Sources/Placeholder.swift"
  if [ ! -f "$PLACEHOLDER" ]; then
    echo "// Placeholder for Tuist module: $MODULE" > "$PLACEHOLDER"
  fi
done

echo "✅ 모듈 디렉토리 초기화 완료!"
