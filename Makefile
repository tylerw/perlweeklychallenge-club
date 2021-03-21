.PHONEY: help
help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
   sort | \
   awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONEY: update-origin-master
update-origin-master: ## update origin/master from upstream (after fetching)
	git fetch --multiple origin upstream
	git push origin upstream/master:master

.PHONEY: prep-for-challenge
prep-for-challenge: ## prep for next challenge
	@.scripts/prep-challenge

.PHONEY: my-prs
my-prs: ## list my prs
	@.scripts/my-prs

.PHONEY: open-my-repo
open-my-repo: ## open my repo's GitHub page in a web browser
	@gh repo view tylerw/perlweeklychallenge-club --web
