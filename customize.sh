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


ax3000t:
base-files busybox ca-bundle dnsmasq dropbear firewall4 fitblk fstools kmod-crypto-hw-safexcel kmod-gpio-button-hotplug kmod-leds-gpio kmod-mt7915e kmod-mt7981-firmware kmod-nft-offload kmod-phy-aquantia libc libgcc libustream-mbedtls logd luci mt7981-wo-firmware mtd netifd nftables odhcp6c odhcpd-ipv6only opkg ppp ppp-mod-pppoe procd procd-seccomp procd-ujail uboot-envtools uci uclient-fetch urandom-seed urngd cgi-io dawn iperf3 libatomic libcap libgcrypt libgpg-error libiperf3 liblua liblucihttp liblucihttp-lua liblucihttp-ucode libopenssl libopenssl-conf libopenssl-legacy librt libubus-lua libuv libwebsockets-full lua luci luci-app-dawn luci-app-firewall luci-app-opkg luci-app-ttyd luci-base luci-compat luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn luci-i18n-opkg-zh-cn luci-i18n-ttyd-zh-cn luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-light luci-lua-runtime luci-mod-admin-full luci-mod-network luci-mod-status luci-mod-system luci-proto-ipv6 luci-proto-ppp luci-theme-bootstrap rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci rpcd-mod-rrdns rpcd-mod-ucode ttyd ucode-mod-html ucode-mod-lua ucode-mod-math uhttpd uhttpd-mod-ubus umdns wpad-openssl zlib