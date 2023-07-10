# Makefile
.PHONY: act_dry_run, act_run
# ACT GitHub actions testing
act_dry_run:
	@echo "ACT GitHub actions testing - dry run" \
	&& act -n -v -W .github/actions/action.yaml

act_run:
	@echo "ACT GitHub actions testing - run" \
	&& act -v -W .github/actions/action.yaml \
	--input-file act.input
	