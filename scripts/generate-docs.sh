#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
DOCS_DIR="$ROOT_DIR/docs/api/generated"
mkdir -p "$DOCS_DIR"

has_any() { shopt -s nullglob globstar; local arr=("$ROOT_DIR"/**/$1); ((${#arr[@]})); }
exists() { command -v "$1" >/dev/null 2>&1; }

note() { printf "\n==> %s\n" "$*"; }
run() { printf "$ %s\n" "$*"; eval "$*"; }

# JavaScript/TypeScript
if has_any "*.ts" || has_any "*.tsx" || has_any "*.js" || has_any "*.jsx"; then
  note "Detected JS/TS files"
  if exists npx; then
    if [ -f "$ROOT_DIR/typedoc.json" ] || [ -f "$ROOT_DIR/tsconfig.json" ]; then
      mkdir -p "$DOCS_DIR/ts"
      note "Generating TypeDoc (Markdown if plugin installed)"
      run "npx --yes typedoc --out $DOCS_DIR/ts" || echo "TypeDoc failed or not installed; install with: npm i -D typedoc typedoc-plugin-markdown"
    else
      echo "Add typedoc.json and tsconfig.json as described in docs/api/javascript-typescript.md"
    fi
  else
    echo "npx not found. Install Node.js or run: npm i -D typedoc"
  fi
fi

# Python
if has_any "*.py"; then
  note "Detected Python files"
  if exists pdoc; then
    mkdir -p "$DOCS_DIR/python"
    echo "Running: pdoc -o $DOCS_DIR/python <your_package_or_module>"
    echo "Replace <your_package_or_module> with your package name (e.g., src_pkg)"
  else
    echo "pdoc not found. Install with: python -m pip install pdoc"
  fi
fi

# Rust
if [ -f "$ROOT_DIR/Cargo.toml" ]; then
  note "Detected Rust crate"
  note "Generating rustdoc (public items only)"
  CARGO_TARGET_DIR="$DOCS_DIR/rust" cargo doc --no-deps || echo "Install Rust/Cargo to generate docs"
  echo "Rust docs under: $DOCS_DIR/rust/doc"
fi

# Java (Maven/Gradle)
if [ -f "$ROOT_DIR/pom.xml" ] || [ -f "$ROOT_DIR/build.gradle" ] || [ -d "$ROOT_DIR/src/main/java" ]; then
  note "Detected Java source"
  if [ -f "$ROOT_DIR/pom.xml" ]; then
    echo "Maven: mvn -q javadoc:javadoc (outputs to target/site/apidocs)"
  fi
  if [ -f "$ROOT_DIR/build.gradle" ]; then
    echo "Gradle: ./gradlew -q javadoc (outputs to build/docs/javadoc)"
  fi
  if [ -d "$ROOT_DIR/src/main/java" ]; then
    echo "Plain: javadoc -d $DOCS_DIR/java -sourcepath src/main/java -subpackages your.base.package"
  fi
fi

# Go
if [ -f "$ROOT_DIR/go.mod" ] || has_any "*.go"; then
  note "Detected Go module/files"
  if exists pkgsite; then
    echo "Run: pkgsite -http=:6060 and visit http://localhost:6060"
  else
    echo "Install pkgsite: go install golang.org/x/pkgsite/cmd/pkgsite@latest"
  fi
fi

note "Done. See docs/ for guides and any generated output under $DOCS_DIR."