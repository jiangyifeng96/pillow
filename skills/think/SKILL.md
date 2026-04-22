---
name: think
description: "Use before building a new feature, making a structural refactor, or choosing between implementation approaches. Produces an approved direction, writes a spec file, and waits for approval before code. Not for trivial edits or mechanical fixes."
metadata:
  version: "0.2.1"
---

# Think

Turn a rough request into an approved direction before implementation starts.

Do not write code inside this skill. The job here is to inspect context, narrow scope, pressure-test options, write a concrete spec, and stop before implementation.

## Hard Gate

- Do not write code, run migrations, scaffold files, or take implementation actions before the user approves the direction.
- Writing a spec is part of this skill.
- Do not commit the spec unless the user explicitly asks.

## When To Use

- new feature
- structural refactor
- architecture decision
- implementation approach with real tradeoffs

If the task is already obvious and fully mechanical, skip this skill.

## Workflow

1. Confirm the working path or repo root first.
2. Inspect relevant files, docs, and current patterns before proposing changes.
3. Check scope early. If the request spans multiple independent areas, decompose it and focus on the first slice.
4. Ask clarifying questions one at a time when needed. Prefer short multiple-choice questions when possible.
5. Offer 2-3 approaches. Always include one minimal option.
6. Recommend one approach clearly. Explain why it fits the current repo better than the others.
7. Present the design at the right level of detail. Cover:
   - architecture or module shape
   - data flow or control flow
   - failure handling
   - verification
   - what will not be built
8. Wait for approval.
9. After approval, choose the spec path in this order:
   - a user-specified path
   - `docs/specs/YYYY-MM-DD-<topic>.md` if the current project already has a `docs/` directory
   - `.agents/specs/YYYY-MM-DD-<topic>.md` otherwise
10. Write the spec and ask the user to review it before implementation starts.

## Spec Requirements

- Be direct. Do not present fake neutrality if one option is clearly better.
- Prefer the smallest approach that still solves the actual problem.
- Follow existing repo patterns unless there is a concrete reason not to.
- If an official or built-in solution exists, consider it before inventing a custom one.
- Do not add unrelated refactors.
- No placeholders such as `TBD`, `TODO`, or "decide later".
- If the direction is rejected, ask what failed and revise from there. Do not restart blindly.

## Lightweight Mode

Use a shorter flow when the request is narrow and the main question is only which fix or approach to take.

1. Inspect the relevant context.
2. Ask at most one clarifying question if needed.
3. Give 2-3 options and recommend one.
4. Summarize scope, main risk, affected files, and verification.
5. Wait for approval, then write a short spec and stop.

## Self-Check Before Writing The Spec

- Is the scope small enough for one implementation pass?
- Are likely files or modules named?
- Is the riskiest assumption explicit?
- Are happy path, failure path, and edge verification listed?
- If the work touches many files or multiple modules, did you say so directly?
- Is the spec concrete enough that implementation can start without another planning round?

## Spec Structure

Use this structure unless the task is tiny:

```text
# <Title>

## Goal
## Context
## Scope
### In
### Out
## Options Considered
## Recommendation
## Design
## Risks
## Verification
## Next Step
```

Use `skills/think/templates/spec-template.md` as the default template and `skills/think/examples/think-skill-v0.2.md` as a reference example when needed.

## Output

Use this structure:

```text
Goal:

Context:

Options:
1. ...
2. ...

Recommendation:

Design:

Risk:

Verification:

Spec:
- path: <chosen-project-spec-path>
- status: pending approval | written
```

After the spec is written, stop. Implementation starts only when the user asks.
