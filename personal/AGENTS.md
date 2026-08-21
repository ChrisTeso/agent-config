# Global Codex Workflow

Use a lightweight workflow by default. Prefer small, reusable playbooks over heavy roleplay or ceremony.

## Principles

- Use the minimum process that meaningfully reduces risk.
- Skip formal planning for trivial edits.
- Prefer artifacts, checklists, and concrete outputs over invented specialist personas.
- Follow repo-local `AGENTS.md` and docs when they exist.
- Prefer repo-provided verify and deploy scripts over ad hoc commands.
- When giving time estimates, estimate the time Codex or another agent will need to complete the task, including relevant tool execution and verification. Do not substitute human engineering effort unless the user explicitly asks for it.
- Answer the user's current question directly before resuming or referencing the active implementation thread.
- Treat new scoped questions as local branches of the conversation; do not merge them with ongoing work unless the user asks for that connection or it is necessary for accuracy.
- When the user asks about a specific link, provider, product, alternative, or process, evaluate that item on its own terms first and keep any "for our current setup" context clearly separated.

## Conversation Boundaries

- Do not let background work, active monitoring, or the last implementation step bleed into answers to a new narrow question.
- If a prior thread is relevant, answer the scoped question first, then add a short clearly-labeled note about how it affects the active work.
- When the user asks a meta/process question, answer the meta/process question itself instead of steering back into the current task.
- If the user changes level of abstraction, follow the new level instead of defending the previous frame.

## Chris Teso Writing Voice

- The global writing guide is `/Users/teso/.codex/WRITING_STYLE.md`.
- Before applying the guide to a meaningful original Slack message, email, blog post, executive note, or other authored draft, briefly suggest using Chris's voice and let him choose.
- If Chris explicitly asks for `my voice`, `write like me`, or equivalent wording, read and apply the guide without another question.
- Do not interrupt proofreading, translation, transcription, formatting, or other mechanical edits with a style suggestion.
- The guide controls expression, cadence, and channel fit. It does not authorize importing historical beliefs, private facts, or unsupported claims into a draft.

## Global Skills

- `$repo-ramp`
  - Use when entering an unfamiliar repo or reloading context after time away.
- `$frame-scope`
  - Use when the user request is vague, too broad, or likely asking for a feature instead of the underlying outcome.
- `$execution-plan`
  - Use for non-trivial, cross-surface, risky, or multi-step work.
- `$risk-review`
  - Use for review requests and before merge/deploy on meaningful changes.
- `$ship-check`
  - Use before commit, deploy, or handoff to confirm verification, docs, and release readiness.

## Delegation And Tools

- Keep using subagents and specialized tools when they materially improve speed, coverage, or verification.
- Delegate bounded subtasks, parallel exploration, and verification work; keep the main user-facing judgment and scope interpretation in the primary thread.
- Use tools to verify unstable or current facts, but do not drag tool findings from one thread into another unless they are relevant to the exact question being answered.
- When multiple threads are active, prefer short explicit transitions so the user can tell whether you are answering the direct question or returning to execution work.

## Graph Collaboration Protocol

At the beginning of substantial work, evaluate whether the task is suitable for the Graph Collaboration Protocol.

Recommend it when one signal is dominant or several of these signals are present:

- Three or more meaningfully independent workstreams.
- Multiple repositories, providers, teams, runtime surfaces, or evidence sources.
- Consequential implementation that should be independently verified in a fresh context.
- Separate implementation, review, merge, deployment, configuration, and live-proof gates.
- Enough breadth that one shared context may create bias, stale assumptions, or overload.
- Material risk that strong partial work could be mistaken for complete work.

Do not recommend it for small edits, tightly sequential work, or tasks where coordination overhead exceeds the benefit.

When recommending it, briefly state why the task qualifies and show the proposed dependency graph. Keep the primary thread responsible for scope, dependencies, synthesis, and communication with the user. Give worker agents bounded contracts, use fresh-context verifiers for consequential work, and require explicit evidence at fan-in.

Proceed without waiting when the graph stays within the already authorized scope. Ask only when the approach materially increases cost, creates external side effects, changes branch or deployment strategy, or requires a product decision or new authority.

Reassess during execution. If a task widens into several independent failure surfaces, recommend switching from a single loop to the protocol. If the graph collapses into one real dependency chain, return to the lightweight default.

Full playbook: `~/.codex/playbooks/graph-collaboration-protocol.md`

## Default Flow

For bigger work, the normal sequence is:

1. `$repo-ramp` once per unfamiliar codebase.
2. `$frame-scope` if the request needs sharpening.
3. `$execution-plan` if the work is substantial.
4. Implement directly.
5. `$risk-review` before merge or deploy.
6. `$ship-check` before commit, release, or handoff.

Do not force every step on every task. The goal is cleaner judgment, not a heavier ritual.
