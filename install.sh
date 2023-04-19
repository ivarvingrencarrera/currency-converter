poetry config virtualenvs.in-project true
poetry shell
poetry install --no-interaction --no-ansi -vvv
poetry run make install_hooks