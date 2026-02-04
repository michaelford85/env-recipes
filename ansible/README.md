# Ansible Toolbox Environment

This environment provides a clean, isolated Ansible setup for:

- playbook development
- linting
- Molecule testing

## Included tools

- ansible
- ansible-lint
- molecule
- molecule-plugins[docker]

## Usage

Build the environment:
```bash
./scripts/mkenv.sh ansible
```

Activate it:
```bash
source ~/.venvs/ansible/bin/activate
```

Verify:
```bash
ansible --version
ansible-lint --version
molecule --version
```

## Notes

- Docker is required for Molecule Docker scenarios
- On Raspberry Pi OS, some Molecule drivers may not be available
