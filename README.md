# Agent Configuration

This repository is the source of truth for Chris Teso's global agent instructions and reusable operating protocols.

## Contents

- [`personal/AGENTS.md`](personal/AGENTS.md): Chris's live global Codex workflow.
- [`protocols/graph-collaboration-protocol.md`](protocols/graph-collaboration-protocol.md): canonical, identity-neutral Graph Collaboration Protocol used by the global workflow and suitable for sharing with a team.

## Operating Model

The files in this repository are canonical. The live files under `~/.codex` are symbolic links to this repository, so edits are versioned without maintaining duplicate copies.

Run `./scripts/install.sh` after cloning to create those links. The script refuses to replace existing regular files; move or back them up first.

Small tasks use a lightweight agent loop. The Graph Collaboration Protocol is reserved for substantial work with independent workstreams, multiple systems, fresh-verification needs, or separate implementation and delivery gates.

## Sharing

The files under `protocols/` are generic and suitable for sharing with the team. Treat files under `personal/` as individualized configuration and review them before distributing.

This repository is public so its generic protocols can be shared. Keep credentials, secrets, and sensitive personal configuration out of the repository.

## Adding Material

Place personal global instructions and private workflow configuration under `personal/`. Put reusable, identity-neutral playbooks under `protocols/`. Keep one canonical copy of each artifact and use symbolic links for live configuration.
