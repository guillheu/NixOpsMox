{ config, pkgs, ... }:

{
  proxmox.qemuConf = {
    cores = 2;
    virtio0 = "data-volumes:vm-9999-disk-0";
  };
}
