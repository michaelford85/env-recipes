# 📦 env-recipes

A collection of **reproducible, tool-focused Python virtual environment recipes**.

This repository is intentionally **not project-based**.
Each folder defines a *toolbox environment* (e.g. Ansible, MongoDB+Python) that can be **destroyed and recreated at any time**.

The actual virtual environments are **ephemeral** and live outside this repo (usually in `~/.venvs/`).

---

## Toolboxes

- `ansible/` — Ansible + linting + Molecule
- `mongo-py/` — MongoDB client libs + interactive Python
- `langchain-dev/` — LangChain development toolbox (includes `uv`)

