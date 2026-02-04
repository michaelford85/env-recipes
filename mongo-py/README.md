# MongoDB + Python Toolbox Environment (`mongo-py`)

This toolbox is an **interactive Python environment** for working with MongoDB from Python.

## Included tools

- `pymongo` (MongoDB Python driver)
- `motor` (async MongoDB driver)
- `ipython` (nice REPL)
- `python-dotenv` (load `.env` files)
- `rich` (better printing/log output)

## Usage

Build the environment:
```bash
../scripts/mkenv.sh mongo-py
```

Activate it:
```bash
source ~/.venvs/mongo-py/bin/activate
```

Quick sanity check:
```bash
python -c "import pymongo; print(pymongo.__version__)"
python -c "import motor; print(motor.__version__)"
```

## Notes

- This toolbox installs **Python client libraries**. It does *not* install `mongod`, `mongosh`, or MongoDB server tools.
- For server tooling, use your OS package manager or Docker.
