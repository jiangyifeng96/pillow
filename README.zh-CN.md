# Pillow

[English](./README.md) | [简体中文](./README.zh-CN.md)

Pillow 是我的个人 skill 仓库，主要给编码代理使用。

这个仓库当前只保留了一个核心 skill：`think`。我主要用它在真正开始写代码之前，把模糊需求先收敛成清晰的实现方向。整个仓库会刻意保持轻量，方便我后续持续添加和扩展。

## 我的使用习惯

- 尽量用明确触发，而不是大范围自动激活
- 每个 skill 都只做一类事情，方便组合使用
- 把真正重复出现的工作习惯沉淀成可复用说明
- 只有当某种方法反复证明有价值时，才继续新增 skill

## 当前 Skills

| Skill | 适用场景 | 作用 |
|---|---|---|
| `think` | 新功能、结构性重构、架构决策之前 | 在写代码前把模糊需求收敛成清晰实现方向 |

## 使用说明

- `think`：适合在做新功能、重构方案或技术设计前使用。

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
