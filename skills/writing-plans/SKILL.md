---
name: writing-plans
description: "Use when an approved design, Design Summary, or clear requirements need to be converted into an executable task plan."
---

# Writing Plans

Convert a Design Summary, approved design, or clear requirements into a maintainable execution plan.

This skill can follow `think`, but it does not depend on `think`. It can also work from a clear user request, spec, or existing project context.

This skill produces a task plan. Do not implement, write code, commit changes, hand off to a fixed execution mode, or modify project files, except for saving an approved plan under `docs/plans/YYYY-MM-DD-xxx.md` after explicit user approval.

## Trigger only when

Use this skill only when at least one of these is true:
- there is an approved Design Summary that needs to become executable tasks
- the user provides clear requirements and asks for an implementation plan
- the work spans multiple steps, files, or components
- the implementation needs sequencing, validation, or cleanup planning
- the user explicitly asks to create or write a plan

## Do not use when

Do not use this skill when:
- the request still needs design clarification or approach comparison
- the task is small, obvious, and safe to execute directly
- the user only wants explanation, summary, translation, or wording help
- the user asks for implementation rather than planning

If the request is not ready for planning, ask the minimum needed clarification or suggest using `think`.

## Workflow

1. **Confirm planning input**
   - Start from the Design Summary, approved design, clear requirements, or user-provided spec.
   - If critical information is missing, ask a short clarification question.
   - Do not redesign the solution unless the input is clearly incomplete or inconsistent.

2. **Explore project context**
   - Briefly inspect the most relevant files, docs, and local patterns.
   - Identify existing architecture, conventions, tech stack, and likely affected areas.
   - Keep recon targeted and minimal.

3. **Check scope**
   - If the work spans multiple independent problems, split it into separate plan sections or separate plans.
   - Each plan should produce working, testable progress.
   - Do not hide large unrelated changes inside one plan.

4. **Define plan header**
   - Every plan should start with a fixed header:
     - title
     - goal
     - source / context
     - architecture
     - tech stack
     - scope
     - non-goals
     - assumptions
     - risks

5. **Map structure before tasks**
   - List the key components, files, or modules likely to change.
   - Explain each responsibility briefly.
   - Follow existing project patterns.
   - Prefer small focused changes over broad rewrites.

6. **Break work into tasks**
   - Create ordered, executable tasks.
   - Each task should be concrete enough to implement without rethinking the plan.
   - Do not include code blocks or implementation code.
   - For each task, include:
     - purpose
     - files or components involved
     - actions to take
     - validation method
     - maintenance / cleanup notes
     - done criteria

7. **Plan for maintainability**
   - Keep the future code easy to manage and maintain.
   - Remove redundant or legacy code when it directly relates to the change.
   - Do not add backward compatibility by default.
   - Treat compatibility as an explicit requirement, not a default assumption.
   - If compatibility would increase complexity, prefer a simpler replacement or cleanup path unless the user or project explicitly requires compatibility.
   - Avoid over-engineering.
   - Avoid unrelated refactors.
   - Prefer simple boundaries and clear ownership.

8. **Validation**
   - Include how to verify the completed work.
   - Prefer specific commands, test names, or manual checks when known.
   - If exact commands are unknown, describe the validation intent clearly.

9. **Record decision**
   - After presenting the plan, ask: `是否需要保存到 /docs/plans？`
   - If the user agrees, save it as `docs/plans/YYYY-MM-DD-xxx.md`.
   - Only create or save the plan file after explicit user approval.

## Plan format

When saved, use this filename format:

```text
docs/plans/YYYY-MM-DD-xxx.md
```

Use this structure unless the task is too small to need every section:

```md
# Plan: <title>

## Goal

<What this plan is trying to accomplish.>

## Source / Context

<Design Summary, user request, spec, or other source this plan is based on.>

## Architecture

<High-level structure and how the pieces fit together.>

## Tech Stack

<Languages, frameworks, libraries, tools, and project conventions involved.>

## Scope

<What is included.>

## Non-goals

<What is intentionally excluded.>

## Assumptions

<Assumptions that affect the plan.>

## Risks

<Risks, unknowns, or decisions that may need attention.>

## Structure

- `<file-or-component>`: <responsibility>
- `<file-or-component>`: <responsibility>

## Tasks

### Task 1: <name>

**Purpose:** <why this task exists>

**Files / Components:**
- `<path-or-component>`

**Actions:**
- <concrete action>
- <concrete action>

**Validation:**
- <test, command, or manual check>

**Maintenance notes:**
- <cleanup, simplification, compatibility decision, or future maintenance concern>

**Done when:**
- <observable completion criteria>

### Task 2: <name>

...
```

## Style

- Keep the plan practical and executable.
- Use enough detail to guide implementation, but do not write code.
- Prefer ordered tasks over long prose.
- Be explicit about dependencies between tasks.
- Keep compatibility only when the user or project explicitly requires it.
- Make cleanup visible instead of leaving redundant code behind.
- Do not add commit steps by default.
- Do not prescribe a fixed execution mode.
- Do not hand off to another skill by default.

## End condition

This skill ends after presenting the task plan and asking whether the user wants it saved to `docs/plans/`.
