# Pillow Skill Resolver

This file is the human-readable routing table for Pillow skills.

Model-side matching still comes from each `SKILL.md` description. Keep this file in sync with those descriptions.

## Pre-build

| Trigger | Skill |
|---|---|
| New feature, implementation direction, architecture choice, structural refactor | `skills/think/SKILL.md` |
| Page, component, landing page, visual polish, interaction design, frontend visual work | `skills/design/SKILL.md` |

## Debugging

| Trigger | Skill |
|---|---|
| Error, crash, failing test, wrong behavior, regression, "why does this break" | `skills/hunt/SKILL.md` |

## Post-build

| Trigger | Skill |
|---|---|
| Review this diff, check before merge, verify this change, look for regressions | `skills/check/SKILL.md` |

## Disambiguation

1. If the user is deciding what to build, use `think`.
2. If the user already knows what to build but the work is visual, use `design`.
3. If there is a concrete failure, use `hunt`.
4. If the change already exists and needs validation, use `check`.
5. If two skills can apply, read both skill files and let the more specific one lead.

