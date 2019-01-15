
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: vpn_connect
vpn_connect: ## Establish the VPN connection in the VM.
	$(if ${VPN_URL},,$(error Must pass VPN_URL=<url>))
	vagrant ssh -- -t /vagrant/client_scripts/vpn_connect "$${VPN_URL}"

.PHONY: vpn_connect
vpn_disconnect: ## Close the VPN connection in the VM.
	vagrant ssh -- -t /opt/cisco/anyconnect/bin/vpn disconnect
