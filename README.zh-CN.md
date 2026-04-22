# Pillow

[English](./README.md) | [简体中文](./README.zh-CN.md)

Pillow 是一个面向编码代理的轻量 skill 集合。

它保留了 Waza 里日常开发真正有用的部分：少量聚焦的 skill、清晰可读的路由表，以及简单直接的仓库校验。它不打算变成一个笨重的工作流操作系统。

## 为什么做这个

重型 skill 包当然很强，但也会带来明显摩擦：

- 自动触发太多
- 小任务也要走很长流程
- 很难快速看懂到底是什么在触发

Pillow 刻意把表面积做小。每个 skill 只做一件事，触发条件尽量收窄，也方便你后续持续扩展。

## 当前 Skills

| Skill | 适用场景 | 作用 |
|---|---|---|
| `think` | 新功能、结构性重构、架构决策之前 | 在写代码前把模糊需求收敛成清晰实现方向 |
| `design` | 构建 UI、页面、可视化组件时 | 明确视觉方向和实现边界，避免通用化的默认界面 |
| `hunt` | 调试报错、测试失败、异常行为时 | 强制先找根因，再改代码 |
| `check` | 实现完成后或合并前 | 审查 diff、检查范围漂移，并用证据完成验证 |

## 仓库结构

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

## 安装

### Codex

```bash
git clone https://github.com/jiangyifeng96/pillow.git ~/.codex/pillow
cd ~/.codex/pillow
./scripts/install-codex.sh
```

安装完成后，重启 Codex。

安装脚本只会创建这一条链接：

```text
~/.agents/skills/pillow -> <repo>/skills
```

如果目标链接已经存在且指向别处，脚本会拒绝覆盖。

## 卸载

### Codex

```bash
cd ~/.codex/pillow
./scripts/uninstall-codex.sh
```

### Claude Code

如果你也想在 Claude Code 里复用同一套目录结构，可以把本仓库的 `skills/` 目录接入它自己的本地 skill 或 plugin 流程。

## 使用说明

- Pillow 故意使用 `think`、`design`、`hunt`、`check` 这种简洁名字。
- 如果你同时安装了 Waza 或其他同名 skill 包，可能会出现触发歧义。
- 如果你想让这套仓库单独工作，最好只启用 Pillow。

## 添加一个新 Skill

1. 创建 `skills/<name>/SKILL.md`
2. 在 `skills/RESOLVER.md` 里增加触发映射
3. 在 `.claude-plugin/marketplace.json` 里增加 skill 条目
4. 运行 `make test`
5. 如果公开 skill 列表发生变化，同步更新 `README.md` 和 `README.zh-CN.md`

## 这个仓库的设计原则

- 每个 skill 都要保持边界清晰
- 共享路由规则统一放在 `skills/RESOLVER.md`
- 能用确定性校验解决的问题，优先放进 `scripts/verify-skills.sh`
- 不要再做一个会强制接管所有流程的巨型 meta-skill
- 只有在重复劳动或确定性要求足够高时，才增加 `references/` 或 `scripts/`

## 开发

```bash
make test
```

当前检查项包括：

- frontmatter 合法性
- marketplace 与 skill 目录一致性
- resolver 覆盖情况
- shell 脚本语法检查
- Codex 安装/卸载 smoke test

## 许可证

MIT
