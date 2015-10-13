.SILENT:
.PHONY: help

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

## Help
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target] type=[type] version=[version]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-16s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	printf "\n${COLOR_COMMENT}Available types:${COLOR_RESET}\n"
	printf " ${COLOR_INFO}vagrant${COLOR_RESET} Vagrant\n"
	printf " ${COLOR_INFO}docker ${COLOR_RESET} Docker\n"

## Build
build: clean roles
ifeq (${type}, docker)
	mkdir -p ~/.packer.d/tmp
	TMPDIR=~/.packer.d/tmp packer build -only=docker -var 'version=${version}' template.json
else
	packer build -only=vagrant -var 'version=${version}' template.json
endif

## Clean
clean:
	printf "${COLOR_INFO}Clean output files ${COLOR_RESET}\n"
	rm -Rf output-*

## Roles
roles:
	printf "${COLOR_INFO}Install ${COLOR_RESET}${template}${COLOR_INFO} ansible galaxy roles into ${COLOR_RESET}ansible/roles:\n"
	ansible-galaxy install -f -r ansible/roles.yml -p ansible/roles
