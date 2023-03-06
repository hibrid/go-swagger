CURDIR=./
DIST := $(CURDIR)/dist

define colorecho
	$(if $(TERM),
		@tput setaf $2
		@echo $1
		@tput sgr0,
		@echo $1)
endef


#
# To be called explicitely if/when templates change
#
bindata: ## Regenerate bindata (templates)
	@cd generator && \
		go-bindata -pkg generator `find templates -type d -print`

#
# We don 't make 'bindata' a dependency prior building the swagger binary by default
# because calling bindata multiple time is not idempotent as the generated timestamp keeps increasing.
#
swagger: ## Build swagger-go binary
	@mkdir -p dist && go build -o ./dist/swagger ./cmd/swagger

help: ## Show this help dialog.
	@echo
	$(call colorecho, "⁉️ Help", 5)
	@echo
	$(call colorecho, "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' | column -c2 -t -s :)", 4)
	@echo


clean: ## Clean swagger binary
	@rm -f ./dist/swagger

.PHONY:	bindata swagger help


