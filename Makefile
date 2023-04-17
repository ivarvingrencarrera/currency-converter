lint:
	isort . 
	ruff .
	blue --check --diff --color .
	mypy .
	pip-audit
	


format:
	ruff --silent --exit-zero --fix .
	blue .

test:
	pytest --cov-report term-missing --cov-report html --cov-branch --cov currency_converter/