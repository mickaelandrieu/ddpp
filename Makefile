.PHONY: all clickhouse metabase n8n nginx_proxy_manager

all: check-docker clickhouse metabase n8n nginx_proxy_manager

check-docker:
	@docker version >$null 2>&1 || (echo "Docker is not running. Please start Docker and try again." && exit 1)
