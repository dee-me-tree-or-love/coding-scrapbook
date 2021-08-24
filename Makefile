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
.PHONY : help
help : Makefile
	@sed -n 's/^#@//p' $<

#@ new-project (np):	Create new project named $(project) for given category $(category) ; $ make np category=C project=Counter
.PHONY: new-project np
new-project np: require-category-env require-project-env fail-if-project-readme-exists
	git checkout -b tp-$(project)-$(category)-init
	mkdir -p ./$(category)/$(project)
	touch ./$(category)/$(project)/README.md
	@echo "Done!"
# ----