### Makefile argument checks and behavior rules:
.PHONY: require-category-env require-project-env fail-if-project-readme-exists
require-category-env:
ifndef category
	$(error "category" argument is missing)
endif
require-project-env:
ifndef project
	$(error "project" argument is missing)
endif
fail-if-project-readme-exists:
ifneq ("$(wildcard ./$(category)/$(project)/README.md)","")
	$(error "./$(category)/$(project)/README.md" already exists, verify that the project is really new)
endif
# ----

### Commands
#@ help:			Get documentation of available make targets.
.PHONY: help
help: Makefile
	@echo "👋 Hello.\n~~~~~~~~~\nSee the list of all available targets below:\n--------------------------------------------"
	@sed -n 's/^#@//p' $<

#@ new-project (np):	Create new project named $(project) for given category $(category).
#@						Example: $ make np category=C project=Counter
.PHONY: new-project np
new-project np: require-category-env require-project-env fail-if-project-readme-exists
	git checkout -b tp-$(project)-$(category)-init
	mkdir -p ./$(category)/$(project)
	touch ./$(category)/$(project)/README.md
	@echo "Done!"

#@ main:			Checkout the main branch of the scrapbook
.PHONY: main
main:
	git checkout main

#@ list:			Lists existing and "IN_PROGRESS" projects
.PHONY: list
list:
	@echo "See following categories and projects:"
	@ls -d ./*/* | xargs -I{} echo '-> {}'

#@ clean:			Removes leftover and bulky files from the repository.
.PHONY: clean
clean:
	@echo "Removing different bulk files."
	rm -rf ./**/node_modules/
	@echo "Done."
# ----