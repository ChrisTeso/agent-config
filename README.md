# Agent Configuration

This repository is the source of truth for Chris Teso's global agent instructions and reusable operating protocols.

## Contents

- [`personal/AGENTS.md`](personal/AGENTS.md): Chris's live global Codex workflow.
- [`personal/protocols/graph-collaboration-protocol.md`](personal/protocols/graph-collaboration-protocol.md): personalized Graph Collaboration Protocol used by the global workflow.
- [`shared/graph-collaboration-protocol.md`](shared/graph-collaboration-protocol.md): generic team edition with personal and Toolbelt-specific language removed.

## Operating Model

The personal files are canonical. The live files under `~/.codex` are symbolic links to this repository, so edits are versioned without maintaining duplicate copies.

Run `./scripts/install.sh` after cloning to create those links. The script refuses to replace existing regular files; move or back them up first.

Small tasks use a lightweight agent loop. The Graph Collaboration Protocol is reserved for substantial work with independent workstreams, multiple systems, fresh-verification needs, or separate implementation and delivery gates.

## Sharing

Share files from `shared/` with the team. Treat files under `personal/` as individualized configuration and review them before distributing.

This repository is private by default because future agent configuration may include personal paths, preferences, or workflow details.

## Adding Material

Place personal global instructions and private workflow configuration under `personal/`. Put reusable, identity-neutral playbooks under `shared/`. Keep one canonical copy of each artifact and use symbolic links for live configuration.
