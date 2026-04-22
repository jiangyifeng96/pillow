# Pillow

[English](./README.md) | [简体中文](./README.zh-CN.md)

Pillow is a lightweight skill collection for coding agents.

It takes the part of Waza that is actually useful in daily work: a small set of focused skills, a readable resolver, and simple repository checks. It does not try to become a full workflow operating system.

## Why

Heavy skill packs are powerful, but they also create friction:

- too many automatic triggers
- too much process for small tasks
- hard to understand what fires and why

Pillow keeps the surface area small. Each skill does one job, has a narrow trigger, and stays easy to extend.

## Current Skills

| Skill | When | What it does |
|---|---|---|
| `think` | Before a new feature, structural refactor, or architecture decision | Turns a rough request into a concise implementation direction before code is written |
| `design` | When building UI, pages, or visual components | Sets a clear visual direction and implementation guardrails, not generic UI |
| `hunt` | When debugging errors, failing tests, or unexpected behavior | Forces a root-cause-first workflow before changing code |
| `check` | After implementation or before merging | Reviews the diff, checks scope drift, and verifies the work with evidence |

## Structure

```text
.
├── .claude-plugin/marketplace.json
├── .github/workflows/test.yml
├── rules/
│   └── chinese.md
├── scripts/
│   ├── install-codex.sh
│   ├── uninstall-codex.sh
│   └── verify-skills.sh
├── skills/
│   ├── RESOLVER.md
│   ├── check/
│   │   └── SKILL.md
│   ├── design/
│   │   └── SKILL.md
│   ├── hunt/
│   │   └── SKILL.md
│   └── think/
│       └── SKILL.md
├── .gitignore
├── LICENSE
└── Makefile
```

## Install

### Codex

```bash
git clone https://github.com/jiangyifeng96/pillow.git ~/.codex/pillow
cd ~/.codex/pillow
./scripts/install-codex.sh
```

Restart Codex after installation.

The installer only creates this link:

```text
~/.agents/skills/pillow -> <repo>/skills
```

If the link already exists and points somewhere else, the script refuses to overwrite it.

## Uninstall

### Codex

```bash
cd ~/.codex/pillow
./scripts/uninstall-codex.sh
```

### Claude Code

If you want to reuse the same repository layout in Claude Code, point your local skills or plugin workflow at this repo's `skills/` directory.

## Usage Notes

- Pillow intentionally uses plain names like `think`, `design`, `hunt`, `check`.
- If you also install Waza or another pack with the same skill names, trigger ambiguity may happen.
- If you want a single active pack, use Pillow alone.

## Add a New Skill

1. Create `skills/<name>/SKILL.md`.
2. Add the trigger mapping to `skills/RESOLVER.md`.
3. Add the skill entry to `.claude-plugin/marketplace.json`.
4. Run `make test`.
5. Adjust `README.md` if the public skill list changed.

## Design Rules For This Repo

- Keep each skill narrow.
- Put shared routing rules in `skills/RESOLVER.md`.
- Prefer simple deterministic validation in `scripts/verify-skills.sh`.
- Do not create a giant meta-skill that forces every workflow.
- Add references or scripts only when repetition or determinism justifies them.

## Development

```bash
make test
```

Current checks:

- frontmatter validity
- marketplace and skill directory parity
- resolver coverage
- basic shell syntax check
- Codex install/uninstall smoke test

## License

MIT
