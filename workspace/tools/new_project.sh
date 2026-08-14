#!/usr/bin/env bash

set -e

PROJECT_NAME="${1:-my_project}"

mkdir -p "${PROJECT_NAME}/src/domain/"{entities,value_objects,services,repositories,exceptions}
mkdir -p "${PROJECT_NAME}/src/usecases"
mkdir -p "${PROJECT_NAME}/src/adapters/"{controllers,repositories,presenters}
mkdir -p "${PROJECT_NAME}/src/infrastructure/"{db,web}
mkdir -p "${PROJECT_NAME}/tests"

# モジュール定義用 mod.rs の生成
for dir in domain domain/entities domain/value_objects domain/services domain/repositories domain/exceptions \
           usecases adapters adapters/controllers adapters/repositories adapters/presenters \
           infrastructure infrastructure/db infrastructure/web; do
    touch "${PROJECT_NAME}/src/${dir}/mod.rs"
done

cat <<EOF > "${PROJECT_NAME}/Cargo.toml"
[package]
name = "${PROJECT_NAME}"
version = "0.1.0"
edition = "2021"

[dependencies]
EOF

cat <<'EOF' > "${PROJECT_NAME}/src/main.rs"
mod domain;
mod usecases;
mod adapters;
mod infrastructure;

fn main() {
    println!("Hello from Clean Architecture Rust Project!");
}
EOF