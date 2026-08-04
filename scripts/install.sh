#!/usr/bin/env bash

set -euo pipefail

repository_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
codex_root="${CODEX_HOME:-$HOME/.codex}"
playbook_root="$codex_root/playbooks"

link_file() {
  local source_path="$1"
  local target_path="$2"

  if [[ -e "$target_path" && ! -L "$target_path" ]]; then
    echo "Refusing to replace existing file: $target_path" >&2
    echo "Move or back it up, then run this script again." >&2
    return 1
  fi

  ln -sfn "$source_path" "$target_path"
  echo "Linked $target_path -> $source_path"
}

mkdir -p "$playbook_root"

link_file "$repository_root/personal/AGENTS.md" "$codex_root/AGENTS.md"
link_file "$repository_root/personal/protocols/graph-collaboration-protocol.md" "$playbook_root/graph-collaboration-protocol.md"
