---
name: check
description: "Use after implementation or before merging. Reviews the diff for drift, risky changes, and missing verification, then summarizes what is safe and what still needs attention. Not for ideation or debugging."
metadata:
  version: "0.1.0"
---

# Check

Review the actual change before claiming it is done.

This skill is for diff review, verification discipline, and merge readiness. It is not for design work and not for debugging active failures.

## Workflow

1. Read the diff against the base branch or target commit range.
2. Classify the review depth:
   - quick
   - standard
   - deep
3. Check:
   - scope drift
   - risky changes
   - missing tests or missing verification
   - new dependencies or hidden behavior changes
4. Fix only obviously safe issues.
5. Run the relevant verification command in the current session.
6. Summarize what is ready and what is blocked.

## Review Depth

- `quick`: small diff, few files, low-risk surface
- `standard`: medium diff or multi-file change
- `deep`: wide diff, data mutation, auth, payment, or infrastructure risk

## Rules

- Findings come before summary.
- If no verification was run, do not claim completion.
- If the diff does not match the stated goal, label it as drift.
- Call out new dependencies explicitly.
- If the work is still broken, switch to `hunt`.

## Output

Use this structure:

```text
Findings:

Scope:

Review depth:

Verification:

Ready / blocked:
```

