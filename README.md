# 📦 env-recipes

A collection of **reproducible, tool-focused Python virtual environment recipes**.

This repository is intentionally **not project-based**.  
Each folder defines a *toolbox environment* (e.g. Ansible, MongoDB+Python) that can be **destroyed and recreated at any time**.

The actual virtual environments are **ephemeral** and live outside this repo (usually in `~/.venvs/`).

---

## Why this exists

- I work across **macOS, Ubuntu, and Raspberry Pi OS**
- I want:
  - isolated Python tool environments
  - deterministic installs
  - zero fear of deleting venvs
- I *don’t* want:
  - global pip installs
  - giant monolithic environments
  - dependencies tied to specific projects

This repo solves that.

---

## Repository layout

```text
env-recipes/
  ansible/
    requirements.in          # Human-edited, top-level deps
    requirements-darwin.txt  # macOS lockfile
    requirements-linux.txt   # Linux (Ubuntu / Pi) lockfile
    README.md
  mongo-py/
    requirements.in
    requirements-darwin.txt
    requirements-linux.txt
  scripts/
    mkenv.sh                 # Rebuilds an env from a recipe
  README.md
```

---

## How it works

1. Each toolbox has a `requirements.in` file with **only direct dependencies**
2. Platform-specific `requirements-*.txt` files are generated using **pip-tools**
3. Virtual environments are rebuilt using `scripts/mkenv.sh`
4. The resulting venv lives in `~/.venvs/<tool-name>`

You can delete and recreate environments at will.

---

## Prerequisites

- Python 3.9+ installed system-wide
- `pip-tools` available somewhere on your system

Install pip-tools:

```bash
python3 -m pip install --user pip-tools
```

---

## Creating / rebuilding an environment

From the repo root:

```bash
./scripts/mkenv.sh ansible
```

Activate it:

```bash
source ~/.venvs/ansible/bin/activate
```

Delete it anytime:

```bash
rm -rf ~/.venvs/ansible
```

Rebuild it when needed.

---

## Updating dependencies

Edit:

```text
ansible/requirements.in
```

Then regenerate lockfiles **on each platform**:

### macOS

```bash
pip-compile ansible/requirements.in \
  -o ansible/requirements-darwin.txt
```

### Ubuntu / Raspberry Pi OS

```bash
pip-compile ansible/requirements.in \
  -o ansible/requirements-linux.txt
```

Commit the updated lockfiles.

---

## Notes on platform differences

- macOS uses `requirements-darwin.txt`
- Linux (Ubuntu + Raspberry Pi OS) uses `requirements-linux.txt`
- If no OS-specific file exists, `requirements.txt` is used as a fallback

Some packages may require system dependencies on Raspberry Pi OS.  
Those should be documented in the toolbox README.

---

## When *not* to use this

- For project-specific dependencies → put them in the project repo
- For single CLI tools → consider `pipx`
- For non-Python tooling → use your OS package manager or containers

---

## Philosophy

> Virtual environments are disposable.  
> The **recipe** is the thing worth keeping.
