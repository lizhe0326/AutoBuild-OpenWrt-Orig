#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf


# base-files block-mount busybox ca-bundle default-settings-chn dnsmasq-full dropbear firewall4 fstools ipv6helper kmod-gpio-button-hotplug kmod-leds-gpio kmod-mt7915-firmware kmod-nf-nathelper kmod-nf-nathelper-extra kmod-nft-offload libc libgcc libustream-openssl logd luci luci-app-opkg luci-compat luci-lib-base luci-lib-fs luci-lib-ipkg mtd netifd nftables opkg ppp ppp-mod-pppoe procd procd-seccomp procd-ujail uboot-envtools uci uclient-fetch urandom-seed urngd wpad-openssl luci-app-passwall luci-app-ttyd luci-app-upnp luci-app-wol
