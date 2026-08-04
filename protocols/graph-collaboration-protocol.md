# Graph Collaboration Protocol

## How Teams and Agents Execute Complex Work

The Graph Collaboration Protocol is a cross-project operating model for substantial work that benefits from bounded parallelism, independent verification, and explicit completion gates. It preserves a lightweight default for ordinary tasks and adds structure only when that structure materially reduces risk or time.

The protocol changes the execution model, not the relationship between the goal owner and the agent. The goal owner remains the human gate. The primary agent thread remains responsible for scope, dependency judgment, synthesis, and communication. Worker contexts perform bounded work. Fresh verifier contexts challenge consequential output. Tests and observed external state decide whether the graph passes.

## Why This Exists

A single capable agent loop is often the best way to make a small change:

```text
understand -> implement -> test -> report
```

Larger work creates different problems:

- Independent investigations are serialized only because they entered one conversation in sequence.
- The same context plans, implements, and grades its own work.
- Long context carries stale assumptions into unrelated workstreams.
- Several good partial results can create the appearance of completion while one expected result is missing.
- Passing tests can be confused with review, merge, deployment, configuration, or live proof.

The protocol addresses those problems by treating substantial work as a dependency graph of bounded loops.

## Suitability Test

Recommend the protocol when one signal is dominant or several of these are present:

- The task contains three or more meaningfully independent workstreams.
- Work crosses repositories, providers, teams, runtime surfaces, or evidence sources.
- A worker's output should be independently verified rather than self-reviewed.
- Implementation, review, merge, deployment, configuration, and live behavior are separate gates.
- The task is wide enough that one context may become overloaded or contaminated by stale assumptions.
- Missing one workstream would create a serious false-completion risk.
- The task has high security, privacy, financial, operational, or production consequences.

Do not use the protocol merely because a task is difficult. Prefer a single loop when:

- The change is small or isolated.
- The work is genuinely sequential.
- Several workers would contend for the same files or unresolved contract.
- Coordination and token cost would exceed the expected benefit.
- One agent can safely retain all required context and verify the result directly.

## Roles

### Goal Owner And Human Gate

The goal owner defines or approves:

- The outcome and product intent.
- Important non-goals and constraints.
- Product, UX, policy, or business decisions.
- External actions requiring authorization.
- Branch, merge, deployment, or rollout decisions when those are not already authorized.

The protocol should reduce interruptions, not multiply them. Technical implementation decisions remain delegated unless they alter scope, product behavior, cost, risk, or external state.

### Primary Agent Thread: Orchestrator And Synthesizer

The primary thread owns:

- Reading the user's intent at the correct level of abstraction.
- Inspecting current authoritative artifacts before decomposition.
- Identifying real, fake, and hidden dependencies.
- Defining bounded worker and verifier contracts.
- Tracking expected nodes and their evidence.
- Reconciling conflicts and integrating results.
- Reporting status, blockers, gates, and decisions clearly to the goal owner.

The primary thread should not automatically implement every line itself. Its highest-value work is maintaining the correct graph and protecting the final judgment.

### Worker Contexts: Bounded Loops

Each worker receives one concrete objective with explicit boundaries. Workers may inspect, implement, test, research, or verify only within that contract.

Workers must not infer that their node represents the whole task. They return evidence and unresolved conditions to the orchestrator.

### Fresh Verifier Contexts: Independent Skeptics

A consequential implementation should be reviewed from a context that did not participate in producing it.

The verifier should receive:

- The objective.
- Acceptance criteria and invariants.
- The relevant diff or artifact.
- Required verification surfaces.
- Known environmental limits.

The verifier should not receive the implementer's persuasive narrative or chain of reasoning unless a specific diagnostic requires it. Its job is to find reasons the node should not pass.

### Anchors: Evidence That Cannot Be Negotiated

Useful anchors include:

- Tests that actually ran.
- Database rows or migrations inspected directly.
- Repository and pull-request state.
- Deployed behavior.
- Browser-visible persisted state.
- Provider acknowledgements at their exact evidentiary level.
- Logs, metrics, and event identifiers.
- Security and privacy invariants.
- Explicit human approval where required.

A plan, generated report, open form, passing local build, published pull request, or provider ingestion acknowledgement is not automatically a completion anchor for later gates.

## Graph Design Rules

### 1. Start With The Goal Contract

Before decomposition, capture:

- Desired outcome.
- Current authoritative sources.
- Acceptance criteria.
- Non-goals.
- Allowed mutation surface.
- Human gates.
- Evidence required for completion.

### 2. Draw Only Real Edges

For every proposed dependency, ask:

> Does the downstream node actually require an output or decision from the upstream node?

If not, remove the edge and consider parallel execution.

Also look for hidden edges:

- Two workers editing the same files.
- Shared schemas, migrations, queues, or provider configuration.
- A common unresolved identity or authorization contract.
- Rate-limited APIs or exclusive test environments.
- One branch that must establish a reusable foundation for another.

Parallel prompts do not create independent work when the underlying resources are shared.

### 3. Give Every Node A Contract

Use this template as appropriate:

```text
NODE:
OBJECTIVE:
INPUTS:
AUTHORITATIVE SOURCES:
ALLOWED CHANGES:
NON-GOALS:
OUTPUT CONTRACT:
REQUIRED TESTS OR CHECKS:
STOP CONDITIONS:
DEPENDENCIES:
EVIDENCE REQUIRED:
```

Worker output should make missing or uncertain results explicit:

```text
STATUS: implemented | verified | blocked | failed | no-change
ARTIFACTS:
FILES CHANGED:
CHECKS RUN:
EVIDENCE:
UNVERIFIED ASSUMPTIONS:
REMAINING GATES:
```

### 4. Fan Out Only Where Work Is Independent

Good fan-out candidates include:

- Separate repository or module investigations.
- Independent implementation surfaces behind frozen contracts.
- Test-fixture or evaluation work that does not contend with production code.
- Provider-readiness inspection alongside local implementation.
- Security, privacy, reliability, and UX reviews with distinct questions.

### 5. Reduce Before Synthesis

Use ordinary deterministic checks where possible:

- Count expected versus returned nodes.
- Validate required fields and artifacts.
- Confirm tests and commands actually ran.
- Deduplicate overlapping findings.
- Detect contradictory assumptions.
- Record blockers instead of smoothing them into a narrative.

The orchestrator should synthesize only after reduction. A missing node must remain visible.

### 6. Verify In Fresh Context

Use a fresh verifier when work is consequential, broad, security-sensitive, production-facing, or likely to suffer from implementer bias.

Useful verifier lenses include:

- Correctness and regression risk.
- Authorization and identity boundaries.
- Privacy and data minimization.
- Reliability, idempotency, retries, and partial failure.
- Deployment and runtime provenance.
- Product and UX acceptance criteria.

### 7. Fan In Through Explicit Gates

The final gate should answer:

- Did every expected node return?
- Did every required verifier pass?
- Which evidence is local, CI, merged, deployed, configured, or live?
- Are any assumptions unresolved?
- Are external approvals or mutations still required?
- Can the task truthfully be called complete?

Implementation, verification, review, merge, deployment, provider configuration, and live proof remain distinct statuses unless the task genuinely does not require them.

## Operating Flow

For graph-appropriate work:

1. Inspect the authoritative current state.
2. State why the task qualifies for the protocol.
3. Show the smallest useful dependency graph.
4. Define node contracts and expected outputs.
5. Execute independent nodes in parallel where safe.
6. Run fresh verification for consequential nodes.
7. Reduce outputs and expose missing or conflicting evidence.
8. Integrate only after required upstream contracts pass.
9. Run final anchors proportionate to the risk.
10. Report the outcome, remaining gates, and next concrete check.

If the task widens during execution, recommend switching into the protocol. If investigation reveals one real sequential chain, collapse the graph and return to the lightweight default.

## User-Facing Recommendation

When the protocol is appropriate, use a short recommendation such as:

> This is a good candidate for the Graph Collaboration Protocol because it crosses two repositories, three provider surfaces, and has independent implementation and verification work. I recommend: foundation -> parallel provider and readiness workstreams -> fresh verification -> fan-in gate. I can proceed within the current scope.

Do not ask for approval merely to use internal structure. Proceed when the graph stays inside the already authorized task. Ask only when it materially increases cost, creates external side effects, changes branch or deployment strategy, requires another person's action, or needs a product decision.

## Multi-Surface Product Example

A substantial product release spanning application, service, and provider work can be executed as:

```text
Goal owner approves objective, scope, and human gates
                    |
                    v
       Primary thread refreshes current truth
                    |
                    v
       Foundation rebase and verification
                    |
        +-----------+-----------+
        |                       |
        v                       v
 Service workstream       Application workstream
 separate context         separate context
        |                       |
        v                       v
 fresh verifier          fresh verifier
        +-----------+-----------+
                    |
                    v
          Provider-readiness workstream
                    |
                    v
          Deterministic fan-in gate
                    |
                    v
            Controlled staging proof
                    |
                    v
             Release-risk review
                    |
                    v
             Report to goal owner
```

The important edges are the foundation, shared identity and authorization contracts, cross-surface interfaces, and approved provider configuration. Service implementation, application implementation, provider-readiness inspection, and independent security review can fan out only after their shared contracts are stable.

The work is not complete because code exists or tests pass. Merge state, deployment, provider configuration, controlled recipients, delivery evidence, observability, and human gates remain explicit.

## Success Standard

The protocol succeeds when it improves speed, coverage, or trust without making the collaboration feel heavier.

Use the minimum graph that exposes the real dependencies. Preserve the goal owner's product control. Keep the primary conversation clear. Let bounded workers create breadth, fresh verifiers create skepticism, and external evidence decide what is actually done.
