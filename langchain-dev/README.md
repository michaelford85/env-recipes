# LangChain Development Toolbox (`langchain-dev`)

This toolbox is a **general-purpose LangChain development environment** you can rebuild on demand across
macOS, Ubuntu, and Raspberry Pi OS.

It includes:
- LangChain core + common integrations
- a nice REPL setup (IPython, Rich)
- `uv` (fast installer / resolver) as an optional convenience tool

## Build / activate

From the repo root:

```bash
../scripts/mkenv.sh langchain-dev
source ~/.venvs/langchain-dev/bin/activate
```

Quick sanity check:

```bash
python -c "import langchain; print(langchain.__version__)"
python -c "import uv; print('uv available')"
```

## Pinning for reproducibility

This directory ships with **starter** `requirements-*.txt` files that install cleanly.
For fully reproducible rebuilds, generate pinned lockfiles per platform:

```bash
python3 -m pip install --user pip-tools

# macOS
pip-compile requirements.in -o requirements-darwin.txt

# Ubuntu / Raspberry Pi OS
pip-compile requirements.in -o requirements-linux.txt
```

## Notes

- LangChain integrations are modular. If you only use one provider, remove the others from `requirements.in`.
- `uv` is often installed via Astral's standalone installer, but it can also be installed via pip; this toolbox includes it for convenience.
