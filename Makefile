export ENV := dev
export GOOGLE_PROJECT := roronya-$(ENV)
export DRONE_SECRET := $(shell gsutil cat gs://roronya-$(ENV)-credentials/drone/drone_secret)
export DRONE_HOST := http://$(ENV)-drone.roronya.me
export DRONE_DB_USER := $(shell gsutil cat gs://roronya-$(ENV)-credentials/drone/db_user)
export DRONE_DB_PASS := $(shell gsutil cat gs://roronya-$(ENV)-credentials/drone/db_password)
export DRONE_DB_CONNECTION_NAME := roronya-$(ENV):asia-northeast1:drone
export DRONE_DB_NAME := drone
export DRONE_GITHUB_CLIENT := $(shell gsutil cat gs://roronya-$(ENV)-credentials/github/client_id)
export DRONE_GITHUB_SECRET := $(shell gsutil cat gs://roronya-$(ENV)-credentials/github/client_secret)
export REVISION := $(shell date "+%Y%m%d-%H%M%S")

.PHONY: vagrant_up
.PHONY: vagrant_provision
.PHONY: vagrant_destroy
.PHONY: packer_build

account.json:
	gsutil cat gs://roronya-dev$(ENV)-credentials/service_accounts/packer.json > account.json

vagrant_up:
	vagrant up

vagrant_provision:
	vagrant provision

vagrant_destroy:
	vagrant destroy

packer_build: account.json
	packer build packer.json

