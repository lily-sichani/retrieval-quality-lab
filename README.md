# retrieval-quality-lab

[![CI](https://github.com/niloofarfs/retrieval-quality-lab/actions/workflows/ci.yml/badge.svg)](https://github.com/niloofarfs/retrieval-quality-lab/actions/workflows/ci.yml)

FastAPI-based retrieval evaluation service that compares BM25, dense retrieval, and hybrid RRF, publishes measurable results, and blocks relevance regressions in CI.

## Current status

**Issue 01 establishes tooling and CI only.** Application and retrieval functionality begin in the next issue.

## Prerequisites

- Python 3.12
- [uv](https://docs.astral.sh/uv/)
- Git

## Quick start

Clone the repository and install locked dependencies:

```bash
git clone git@github.com:niloofarfs/retrieval-quality-lab.git
cd retrieval-quality-lab
uv sync --locked
```

`uv sync --locked` installs exactly the versions recorded in `uv.lock`. If `pyproject.toml` and `uv.lock` disagree, the command fails instead of silently updating the lockfile.

## Command reference

Prefer the Makefile targets. They are the supported local and CI interface.

| Make target | Direct command | Purpose |
|-------------|----------------|---------|
| `make setup` | `uv sync --locked` | Install locked dependencies |
| `make lock-check` | `uv lock --check` | Verify lockfile matches `pyproject.toml` |
| `make lint` | `uv run ruff check .` | Lint source and tests |
| `make format-check` | `uv run ruff format --check .` | Check formatting |
| `make type-check` | `uv run mypy src` | Static type checking |
| `make test` | `uv run pytest` | Run tests and print a coverage report |
| `make check` | *(runs the quality targets above)* | Run lock-check, lint, format-check, type-check, and test |

Coverage is reported by Pytest. No minimum coverage percentage is currently enforced.

## Project layout

Source code lives under `src/retrieval_quality_lab/`. The `src/` layout ensures tests and tools import the installed package rather than the working directory, catching packaging mistakes early.

## Continuous integration

GitHub Actions runs the same Makefile quality targets as local development on every pull request and push to `main`:

- `make lock-check`
- `make lint`
- `make format-check`
- `make type-check`
- `make test`

## License

MIT — see [LICENSE](LICENSE).
