lint:
	@echo
	isort . 
	@echo
	ruff .
	@echo
	blue --check --diff --color . 
	@echo
	mypy . 
	@echo
	pip-audit > lint_result.txt


format:
	ruff --silent --exit-zero --fix .
	blue .

test:
	pytest --cov-report term-missing --cov-report html --cov-branch --cov currency_converter/