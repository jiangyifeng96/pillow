.PHONY: test verify verify-scripts smoke-install

test: verify verify-scripts smoke-install

verify:
	./scripts/verify-skills.sh

verify-scripts:
	bash -n ./scripts/verify-skills.sh ./scripts/install-codex.sh ./scripts/uninstall-codex.sh

smoke-install:
	@set -e; \
		tmpdir=$$(mktemp -d); \
		home_dir="$$tmpdir/home"; \
		mkdir -p "$$home_dir"; \
		HOME="$$home_dir" /bin/bash ./scripts/install-codex.sh >/dev/null; \
		test -L "$$home_dir/.agents/skills/pillow"; \
		test "$$(cd "$$home_dir/.agents/skills/pillow" && pwd -P)" = "$$(cd ./skills && pwd -P)"; \
		HOME="$$home_dir" /bin/bash ./scripts/install-codex.sh >/dev/null; \
		HOME="$$home_dir" /bin/bash ./scripts/uninstall-codex.sh >/dev/null; \
		test ! -e "$$home_dir/.agents/skills/pillow"; \
		echo "install smoke: ok"
