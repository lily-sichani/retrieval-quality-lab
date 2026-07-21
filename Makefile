.PHONY: setup lock-check lint format-check type-check test check

setup:
	uv sync --locked

lock-check:
	uv lock --check

lint:
	uv run ruff check .

format-check:
	uv run ruff format --check .

type-check:
	uv run mypy src

test:
	uv run pytest

check: lock-check lint format-check type-check test
