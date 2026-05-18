# Makefile for aviation-dash
# Targets:
#   make dev            — local development (auto-loads docker-compose.override.yaml)
#   make prod-proxmox   — production on Proxmox VM (10.8.0.50)
#   make prod-mag       — production on mag.gmu.edu (future)
#   make logs           — tail logs from running stack
#   make logs-init      — watch the prefect-init one-shot job
#   make down           — stop and remove containers
#   make restart        — restart running stack
#   make ps             — show running containers
#   make build          — rebuild images without starting
#   make prefect-shell  — bash shell in prefect-server
#   make db-shell       — psql shell in postgis

.PHONY: dev prod-proxmox prod-mag logs logs-init down restart ps build prefect-shell db-shell

COMPOSE := docker compose
BASE := -f docker-compose.yaml
PROD_PROXMOX := $(BASE) -f compose.prod.proxmox.yaml
PROD_MAG := $(BASE) -f compose.prod.mag.yaml

dev:
	$(COMPOSE) up -d --build

prod-proxmox:
	$(COMPOSE) $(PROD_PROXMOX) up -d --build

prod-mag:
	$(COMPOSE) $(PROD_MAG) up -d --build

logs:
	$(COMPOSE) logs -f --tail=100

logs-init:
	$(COMPOSE) logs -f prefect-init

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

ps:
	$(COMPOSE) ps

build:
	$(COMPOSE) build

prefect-shell:
	$(COMPOSE) exec prefect-server bash

db-shell:
	$(COMPOSE) exec postgis psql -U developer -d app