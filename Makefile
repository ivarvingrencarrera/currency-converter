lint:
	@echo
	mypy . 2>&1 | tee lint_result.txt

format:
	ruff --silent --exit-zero --fix .
	blue .

test:
	pytest --cov-report term-missing --cov-report html --cov-branch --cov currency_converter/