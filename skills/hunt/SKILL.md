---
name: hunt
description: "Use when debugging an error, failing test, crash, or unexpected behavior. Finds and validates the root cause before any code change is applied. Not for feature design or code review."
metadata:
  version: "0.1.0"
---

# Hunt

Debug from evidence, not from guesswork.

Do not patch symptoms first. State the root-cause hypothesis clearly enough that it can be tested.

## Workflow

1. Reproduce the issue or gather the exact failure signal.
2. Trace the execution path to the first trustworthy failure point.
3. Write a one-sentence hypothesis:
   - what is wrong
   - where it is wrong
   - why that explains the symptom
4. Add one targeted check to confirm or reject the hypothesis.
5. Only after confirmation, change code.
6. Verify the fix with the reproduction or test.

## Rules

- If you cannot name a file, function, condition, or line range, the hypothesis is still too vague.
- Do not say "probably fixed" without a rerun.
- If a fix fails and the same symptom remains, stop and rebuild the hypothesis.
- Prefer the smallest reproducible signal over broad logging noise.
- If the problem is "what approach should we take", use `think`, not `hunt`.

## Output

Use this structure:

```text
Symptom:

Hypothesis:

Evidence:

Fix:

Verification:
```

