---
name: think
description: "Use before building a new feature, making a structural refactor, or choosing between implementation approaches. Produces a concise implementation direction and waits for approval before code. Not for bug fixes or trivial edits."
metadata:
  version: "0.1.0"
---

# Think

Turn a rough request into a concrete direction before implementation starts.

Do not write code inside this skill. The job here is to reduce ambiguity, narrow scope, and make the next implementation step obvious.

## Goals

- understand the real task
- inspect the current codebase or repo shape first
- propose a small number of realistic options
- recommend one option clearly
- list risks, touched areas, and verification

## Workflow

1. Confirm the actual problem being solved.
2. Inspect the relevant files, docs, or current repository structure.
3. Offer 2-3 approaches.
4. Recommend one approach with a short reason.
5. Summarize:
   - what will be built
   - what will not be built
   - which files or modules are likely involved
   - main risk
   - how success will be verified
6. Wait for approval before implementation.

## Rules

- Be direct. Do not present fake neutrality if one option is clearly better.
- Prefer the smallest approach that still solves the actual problem.
- If the repo already has an established pattern, follow it unless there is a concrete reason not to.
- If the request is really a bug fix with a clear symptom, stop and use `hunt` instead.
- If the request is mostly visual, pair this with `design`.

## Output

Use this structure:

```text
Goal:

Options:
1. ...
2. ...

Recommendation:

Scope:

Risk:

Verification:
```

