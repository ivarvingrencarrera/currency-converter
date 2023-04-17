#
# Base image
#

FROM python:3.11-slim-bullseye AS base
WORKDIR /app
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=.:src:./.venv/lib/python3.11/site-packages:$PYTHONPATH
RUN apt-get update -y && apt-get upgrade -y apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/*


#
# Development image
#

FROM base AS development 
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=false
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN apt-get install curl -y
RUN curl -sSL https://install.python-poetry.org | python -
COPY pyproject.toml poetry.lock* ./
RUN poetry install --without doc --no-interaction --no-ansi -vvv
RUN poetry export --only main -f requirements.txt > requirements.txt
COPY src /app/src 
COPY test /app/test
COPY Makefile /app
EXPOSE 8000


#
# Production image
#

FROM base AS production
COPY src /app/src
COPY --from=development /app/requirements.txt ./
RUN pip install --no-cache-dir -r /app/requirements.txt
EXPOSE 8000