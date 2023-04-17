# Use a lighter base image
FROM python:3.11-slim-buster AS python
ENV PYTHONUNBUFFERED=1
WORKDIR /app


# Install Python dependencies
FROM python AS python-deps
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN pip install poetry
COPY pyproject.toml poetry.lock* ./
RUN poetry install --only main --no-interaction --no-ansi --no-root -vvv


# Set the final image
FROM python as runtime
COPY src /app/src
COPY --from=python-deps /app/.venv /app/.venv
EXPOSE 8000