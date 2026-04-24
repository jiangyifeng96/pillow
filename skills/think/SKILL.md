---
name: think
description: "Use only when a request is not ready for implementation and needs design clarification, scope shaping, or approach comparison."
---

# Think

Turn an unclear or multi-option request into a compact Design Summary.

This skill is **not** a default pre-step for all work. Use it only when the request still needs shaping before implementation.

This skill only produces the Design Summary. Do not implement, modify files, or create planning artifacts while using this skill.

## Trigger only when

Use this skill only when at least one of these is true:
- the request is underspecified
- the scope or boundaries are unclear
- there are meaningful design tradeoffs
- the work likely spans multiple components or subsystems
- the user explicitly asks to brainstorm, shape, or compare approaches

## Do not use when

Do not use this skill when:
- the task is small and already clear
- there is an obvious low-risk implementation path
- the user only wants explanation, summary, translation, or wording help
- the design is already settled and the next step is straightforward execution

## Workflow

1. **Explore project context**
   - Briefly inspect the most relevant files, docs, and local patterns.
   - Keep recon targeted and minimal.

2. **Check scope**
   - If the request spans multiple independent problems, say so early.
   - Decompose it into smaller parts.
   - Think through only the first subproblem.

3. **Clarify**
   - Ask at most **1-3 rounds** of questions.
   - Each round should focus on **one clarification theme**.
   - In a round, ask **1-3 tightly related questions** in one message.
   - Prioritize:
     - goal
     - constraints
     - success criteria
   - Skip questions that would not materially change the design.
   - If ambiguity remains after 3 rounds, make reasonable assumptions and state them explicitly.

4. **Compare approaches**
   - When real tradeoffs exist, present **2-3 plausible approaches**.
   - For each approach, briefly compare:
     - fit for the goal
     - implementation complexity
     - management and maintenance cost
     - main tradeoff
     - notable risk
   - Recommend one approach.

5. **Visual topics**
   - If visual explanation would help, use a small ASCII sketch.

6. **Design Summary**
   - Provide one compact summary sized to the task.
   - Usually include:
     - goal
     - non-goals
     - chosen approach
     - key components or files likely to change
     - behavior flow or data flow
     - edge cases
     - assumptions
   - Stop after presenting the Design Summary and wait for user feedback or approval.

## Style

- Keep the process lightweight and conversational.
- Prefer one compact design message over section-by-section approval loops.
- Default to conversation, not specs.
- Do not mention browser-based visual tooling.
- Do not add review loops, commit steps, or planning handoffs inside this skill.
- Follow existing project patterns.
- Avoid unrelated refactors.

## End condition

This skill ends after the Design Summary is presented.
