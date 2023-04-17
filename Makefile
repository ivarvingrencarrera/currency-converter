lint:
	isort  
	@echo
	ruff 
	@echo
	blue --check --diff --color 
	@echo
	mypy 
	@echo
	pip-audit
	


format:
	ruff --silent --exit-zero --fix .
	blue .

test:
	pytest --cov-report term-missing --cov-report html --cov-branch --cov currency_converter/