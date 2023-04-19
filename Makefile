testing: 
	pytest --cov-report term-missing --cov-report html --cov-branch --cov currency_converter/

linting:
	isort .
	@echo
	ruff .
	@echo
	blue --check --diff --color .
	@echo
	mypy .
	@echo
	pip-audit

formating:
	ruff --silent --exit-zero --fix .
	blue .

install_hooks:
	@ scripts/install_hooks.sh