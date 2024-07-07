#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' immortalwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' immortalwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm immortalwrt/package/lean/luci-theme-argon -rf


# base-files block-mount busybox ca-bundle default-settings-chn dnsmasq-full dropbear firewall4 fstools ipv6helper kmod-gpio-button-hotplug kmod-leds-gpio kmod-mt7915-firmware kmod-nf-nathelper kmod-nf-nathelper-extra kmod-nft-offload libc libgcc libustream-openssl logd luci luci-app-opkg luci-compat luci-lib-base luci-lib-fs luci-lib-ipkg mtd netifd nftables opkg ppp ppp-mod-pppoe procd procd-seccomp procd-ujail uboot-envtools uci uclient-fetch urandom-seed urngd wpad-openssl luci-app-passwall luci-app-ttyd luci-app-upnp luci-app-wol


# luci-app-dawn luci-app-ddns luci-app-passwall luci-app-passwall_INCLUDE_Xray luci-app-ttyd luci-i18n-dawn-zh-cn luci-i18n-ddns-zh-cn luci-i18n-passwall-zh-cn luci-i18n-ttyd-zh-cn luci-app-upnp luci-app-wol