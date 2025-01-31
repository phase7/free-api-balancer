# Makefile for Django project using UV

# Common variables
VENV_NAME ?= .venv
PYTHON = $(VENV_NAME)/bin/python
DJANGO_ADMIN = $(PYTHON) manage.py
UV = uv

# Default target
help:
	@echo "Available commands:"
	@echo "  make venv      - Create virtual environment using UV"
	@echo "  make install   - Install dependencies using UV"
	@echo "  make run       - Run development server"
	@echo "  make migrate   - Run database migrations"
	@echo "  make shell     - Open Django shell"
	@echo "  make test      - Run tests"
	@echo "  make lint      - Run linting checks"
	@echo "  make clean     - Remove virtual environment"

# Virtual environment management
venv:
	uv venv $(VENV_NAME)
	$(UV) pip install -r requirements.txt

install:
	$(UV) pip install -r requirements.txt

# Django commands
run:
	$(DJANGO_ADMIN) runserver

migrate:
	$(DJANGO_ADMIN) makemigrations
	$(DJANGO_ADMIN) migrate

shell:
	$(DJANGO_ADMIN) shell

test:
	$(DJANGO_ADMIN) test

# Code quality
lint:
	$(UV) pip install ruff
	$(PYTHON) -m ruff check .

# Cleanup
clean:
	rm -rf $(VENV_NAME)

.PHONY: help venv install run migrate shell test lint clean