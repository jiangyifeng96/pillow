# Pillow

[English](./README.md) | [简体中文](./README.zh-CN.md)

Pillow is my personal skill repository for coding agents.

It is currently centered on one core skill: `think`. I use it to turn rough requests into a clear implementation direction before code is written. The repo stays intentionally small so I can keep extending it over time without making it heavy.

## Working Style

- prefer explicit triggers over broad auto-activation
- keep each skill narrow and composable
- turn recurring habits into reusable instructions
- add new skills only when a pattern proves useful more than once

## Skills

| Skill | When | What it does |
|---|---|---|
| `think` | Before a new feature, structural refactor, or architecture decision | Turns a rough request into a concise implementation direction before code is written |

## Usage

- `think`: use before new features, structural refactors, or architecture decisions.

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

## Add a New Skill

1. Create `skills/<name>/SKILL.md`.
2. Add the trigger mapping to `skills/RESOLVER.md`.
3. Add the skill entry to `.claude-plugin/marketplace.json`.
4. Run `make test`.
5. Adjust `README.md` if the public skill list changed.

## Repo Rules

- Keep each skill narrow.
- Put shared routing rules in `skills/RESOLVER.md`.
- Prefer simple deterministic validation in `scripts/verify-skills.sh`.
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
