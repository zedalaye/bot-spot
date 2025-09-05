# Makefile pour simplifier la compilation

.PHONY: build-all \
        build-bot \
        clean \
        run-bot

# Construire tous les binaires
build-all: build-bot

# Construire chaque binaire individuellement
build-bot:
	go build -o bin/bot-spot .

# Nettoyer les binaires
clean:
	rm -rf bin/

# Lancer les services
run-bot:
	go run .

# Installation des dépendances
deps:
	go mod download
	go mod tidy
