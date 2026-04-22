---
name: design
description: "Use when building a UI page, component, or visual flow. Defines a clear visual direction, interaction states, and responsive guardrails before implementation. Not for backend logic or pure data work."
metadata:
  version: "0.1.0"
---

# Design

Use this skill for visual product work: pages, sections, components, layouts, UI polish, and interaction details.

The target is not just "looks okay". The target is a deliberate visual direction that can actually be implemented.

## Goals

- decide the visual direction before styling spreads everywhere
- keep the interface consistent across desktop and mobile
- avoid generic defaults
- make the implementation constraints explicit

## Workflow

1. Identify the screen or flow being designed.
2. Check whether the repo already has a design system or established UI language.
3. Define a direction:
   - tone
   - typography
   - color mood
   - layout rhythm
   - interaction style
4. Describe the key UI sections or component states.
5. Cover responsive behavior and accessibility expectations.
6. Call out anti-patterns to avoid before implementation starts.

## Rules

- Preserve the existing design system when one already exists.
- If there is no visual direction yet, choose one instead of listing vague style adjectives.
- Mention hover, focus, loading, empty, and error states when relevant.
- Avoid "modern clean beautiful" filler language.
- If the task is mostly structure or implementation tradeoffs, use `think` first.

## Output

Use this structure:

```text
Visual direction:

Core UI sections:

Interaction states:

Responsive notes:

Accessibility notes:

Avoid:
```

