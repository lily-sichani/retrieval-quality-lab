# Agent instructions

Canonical, tool-agnostic instructions for coding agents working in this repository.

## Project purpose and current status

`retrieval-quality-lab` is intended to become a portfolio-quality project for retrieval-system experimentation and evaluation.

The repository currently contains only the Python foundation and CI scaffolding from Issue 01. Do not introduce retrieval, evaluation, APIs, Elasticsearch, datasets, deployment, frontend, or other application functionality unless a later issue explicitly requests it.

## Repository conventions

- Python 3.12 is required.
- `uv` is the only Python project and dependency manager. Do not use pip, Poetry, Pipenv, Conda, or parallel requirements files.
- `uv.lock` is committed and must not be edited manually.
- The project uses a `src/` layout.
- Distribution name: `retrieval-quality-lab`.
- Import package: `retrieval_quality_lab`.
- Do not add runtime dependencies speculatively.
- Do not commit generated files, caches, virtual environments, or local secrets (`.env`).

## Canonical local commands

Use these Makefile targets as the supported repository interface. Prefer them over copying equivalent `uv` commands into scripts or documentation without a good reason.

| Target | Verifies |
|--------|----------|
| `make setup` | Installs locked dependencies from `uv.lock` |
| `make lock-check` | Confirms `uv.lock` matches `pyproject.toml` |
| `make lint` | Ruff lint rules pass |
| `make format-check` | Ruff formatting is consistent |
| `make type-check` | Mypy type checks on `src/` pass |
| `make test` | Pytest runs and prints a coverage report |
| `make check` | Runs lock-check, lint, format-check, type-check, and test |

## Development workflow

1. Inspect the repository and relevant instructions before editing.
2. Understand the requested issue and stay inside its scope.
3. Preserve unrelated user changes.
4. Make the smallest coherent change.
5. Explain unfamiliar or important decisions when they first become relevant.
6. Run the relevant checks.
7. Diagnose failures; do not disable or weaken checks to obtain a green result.
8. Review the final diff for scope creep, stale comments, generated clutter, and documentation drift.
9. Report exactly which commands were run and whether they passed.
10. Never claim that GitHub Actions is green unless a real GitHub workflow run has completed successfully.

## Quality and testing rules

- Ruff handles linting and formatting.
- Mypy handles static type checking.
- Pytest handles tests and terminal coverage reporting.
- New behavior must have appropriate tests.
- Prefer tests that verify public behavior over implementation details.
- Do not use path hacks such as manually setting `PYTHONPATH` to conceal broken packaging.
- Do not weaken checks merely to make CI pass.
- Coverage is reported; no minimum coverage threshold is enforced unless a future issue explicitly introduces one.

## CI and security rules

- Local checks and CI must use the same Makefile targets.
- CI must install dependencies from the locked lockfile.
- GitHub Actions permissions must remain least privilege.
- Actions must remain pinned to verified full commit SHAs.
- CI quality checks must not require secrets.
- Do not introduce `pull_request_target` for normal test execution.
- Deployment, publishing, artifact uploading, and release automation are out of scope unless explicitly requested.
- Never commit, log, or place secrets or credentials in `.env.example`.

## Git behavior

Do not commit, push, open a pull request, rewrite history, delete branches, or modify GitHub repository settings unless the user explicitly requests that action.
