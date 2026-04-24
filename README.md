# Pillow

[English](./README.md) | [简体中文](./README.zh-CN.md)

Pillow is my personal repository for coding-agent skills. I use it to keep the workflows I actually rely on, without packaging them as a marketplace-style project.

## Current Skill

| Skill | When | What it does |
|---|---|---|
| `think` | When a request is not ready for implementation | Clarifies scope, compares approaches, and ends with a compact Design Summary before any code work starts |

## Working Style

- prefer explicit triggers over broad auto-activation
- keep each skill narrow and easy to revise
- document habits that are proven useful in real work
- keep the repo lightweight and personal

## Structure

```text
.
├── README.md
├── README.zh-CN.md
├── scripts/
│   ├── install-codex.sh
│   └── uninstall-codex.sh
├── skills/
│   └── think/
│       └── SKILL.md
├── .gitignore
└── LICENSE
```

## Install

```bash
git clone https://github.com/jiangyifeng96/pillow.git ~/.codex/pillow
cd ~/.codex/pillow
./scripts/install-codex.sh
```

The installer creates this symlink:

```text
~/.agents/skills/pillow -> <repo>/skills
```

If that path already exists and points somewhere else, the script refuses to overwrite it.

## Uninstall

```bash
cd ~/.codex/pillow
./scripts/uninstall-codex.sh
```

## Maintenance

- Edit `skills/<name>/SKILL.md` directly when a workflow changes.
- Add a new skill by creating `skills/<name>/SKILL.md`.
- Update the README only when I want the repository description to stay in sync with current habits.

## Notes

- This repo intentionally has no marketplace metadata, resolver table, or automated verification.
- It is optimized for personal use, not for distribution guarantees.

## License

MIT
