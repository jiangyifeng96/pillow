# Think Skill v0.2

## Goal

Refine `think` so it does more than suggest a direction. It should now turn rough requests into an approved direction, write a reusable spec in the active project, and stop before implementation.

## Context

The repository is intentionally small and currently centers on a single skill, `think`. The previous version was useful as a lightweight direction-setting step, but it was too thin in three ways:

- it did not record decisions in a durable place
- it still referenced removed skills
- it did not provide enough structure for larger design discussions

The latest `superpowers` `brainstorming` skill is the main reference for process discipline, especially around approval gates, scope checks, and one-question-at-a-time clarification. The repo should borrow those strengths without inheriting the full weight of spec commits or chained planning skills.

## Scope

### In

- upgrade `skills/think/SKILL.md`
- keep templates and examples inside `skills/think/`
- make runtime spec output target the current project instead of the `pillow` repo root
- document the new behavior in the English and Chinese READMEs
- keep the workflow explicitly non-committing by default

### Out

- adding new skills
- introducing required commits into the workflow
- adding subagent review loops
- binding `think` to another follow-up skill

## Options Considered

1. Keep `think` lightweight and add project-local spec writing
   - Summary: preserve the current repo philosophy while adding a stronger process and a durable artifact
   - Tradeoff: less strict than a full design system, but easier to use daily
2. Rebuild `think` as a near-copy of `brainstorming`
   - Summary: copy the full staged workflow with spec review and transition rules
   - Tradeoff: stronger enforcement, but too heavy for a one-skill personal repo
3. Keep the current `think` and only document a manual spec habit
   - Summary: avoid changing the skill itself and rely on README guidance
   - Tradeoff: lowest implementation effort, but weak enforcement and easy to forget

## Recommendation

Choose option 1. It keeps `pillow` aligned with its lightweight, explicit-trigger philosophy while still adding the two most valuable ideas from `brainstorming`: an approval gate and a durable written spec.

## Design

The new `think` flow should be:

1. inspect project context first
2. check whether the request is too broad and needs decomposition
3. ask clarifying questions one at a time when needed
4. propose 2-3 approaches with one clear recommendation
5. present a concrete design with scope, risks, and verification
6. wait for approval
7. choose a spec path in this order:
   - user-specified path
   - `docs/specs/YYYY-MM-DD-<topic>.md` if the active project already has `docs/`
   - `.agents/specs/YYYY-MM-DD-<topic>.md` otherwise
8. write the spec
9. stop and wait for implementation to be explicitly requested

The spec format should stay simple and consistent. It should capture goal, context, in/out scope, options considered, recommendation, design, risks, verification, and next step.

The workflow should explicitly forbid:

- implementation before approval
- placeholders in the spec
- default commits
- unrelated refactors

## Risks

- The skill could become too heavy if more `brainstorming` mechanics are added later without restraint.
- Users may still skip spec review if the response format does not surface the spec path clearly.

## Verification

- `make test` passes after updating the skill metadata and docs
- the new `think` description matches the marketplace entry
- the README and Chinese README both explain project-local spec output
- the repository keeps templates and examples under `skills/think/`

## Next Step

Use the updated `think` in the next real design request and adjust the template only if the first few specs show repeated gaps.
