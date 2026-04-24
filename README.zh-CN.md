# Pillow

[English](./README.md) | [简体中文](./README.zh-CN.md)

Pillow 是我的个人编码代理 skill 仓库，用来记录我自己真实会用到的工作流，不再把它维护成带 marketplace 和校验配套的分发项目。

## 当前 Skill

| Skill | 适用场景 | 作用 |
|---|---|---|
| `think` | 当一个请求还不适合直接开始实现时 | 用来澄清范围、比较方案，并在真正写代码前收敛成一份紧凑的 Design Summary |

## 我的使用习惯

- 尽量用明确触发，而不是大范围自动激活
- 每个 skill 都保持边界清晰，方便后续直接改
- 只记录在真实工作里证明有价值的习惯
- 仓库保持轻量，优先服务我自己的使用方式

## 仓库结构

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

## 安装

```bash
git clone https://github.com/jiangyifeng96/pillow.git ~/.codex/pillow
cd ~/.codex/pillow
./scripts/install-codex.sh
```

安装脚本会创建这条软链接：

```text
~/.agents/skills/pillow -> <repo>/skills
```

如果这个路径已经存在且指向别处，脚本会拒绝覆盖。

## 卸载

```bash
cd ~/.codex/pillow
./scripts/uninstall-codex.sh
```

## 维护方式

- 当某个工作流变了，直接改 `skills/<name>/SKILL.md`
- 要新增 skill，就直接创建 `skills/<name>/SKILL.md`
- README 只在我希望它和当前习惯保持同步时再更新

## 说明

- 这个仓库故意不再保留 marketplace 元数据、resolver 表和自动校验脚本。
- 它现在是一个偏个人使用的仓库，不追求通用分发保证。

## 许可证

MIT
