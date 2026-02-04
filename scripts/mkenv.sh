#!/usr/bin/env bash
set -euo pipefail

NAME="${1:-}"
if [[ -z "$NAME" ]]; then
  echo "Usage: $0 <env-name>"
  exit 1
fi

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENVS_DIR="${VENVS_DIR:-$HOME/.venvs}"
ENV_DIR="$VENVS_DIR/$NAME"

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
REQ_BASE="$REPO_DIR/$NAME"
REQ_COMMON="$REQ_BASE/requirements.txt"
REQ_OS="$REQ_BASE/requirements-${OS}.txt"

REQ_FILE="$REQ_COMMON"
if [[ -f "$REQ_OS" ]]; then
  REQ_FILE="$REQ_OS"
fi

if [[ ! -f "$REQ_FILE" ]]; then
  echo "No requirements file found for '$NAME'."
  exit 1
fi

rm -rf "$ENV_DIR"
python3 -m venv "$ENV_DIR"
source "$ENV_DIR/bin/activate"
python -m pip install -U pip setuptools wheel
python -m pip install -r "$REQ_FILE"

echo "Activated with: source $ENV_DIR/bin/activate"
