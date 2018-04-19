build:
	docker-compose build base

run-test:
	docker-compose run --rm test

run-dev:
	docker-compose run --rm --service-ports dev

run-prod:
	docker-compose run --rm --service-ports prod

run-prod-detached:
	docker-compose run --rm --service-ports -d prod
