# Makefile

include .env
export

shell:
	nix-shell

build:
	nixos-generate --format proxmox --configuration test-vm.nix -o ./$(LOCAL_VMA_SYMLINK_PATH)

copy:
	scp ./builds/vzdump-qemu-nixos-*.vma.zst $(PROXMOX_USER)@$(PROXMOX_HOST):$(PROXMOX_VMA_PATH)

restore:
	ssh $(PROXMOX_USER)@$(PROXMOX_HOST) -- qmrestore $(PROXMOX_VMA_PATH)vzdump-qemu-nixos-*.vma.zst 400 --unique true
# deploy:

# 1: query the user for the 

# 1: Copy the newly created VMA image to the proxmox host.