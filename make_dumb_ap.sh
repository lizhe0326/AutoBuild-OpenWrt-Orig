#!/bin/ash

# Turn an OpenWrt router with factory settings into a dumb access point
# as outlined in https://openwrt.org/docs/guide-user/network/wifi/dumbap

# use at your own risk !!!!
# backup your router first !!!!
# script expects factory settings !!!!


# these services do not run on dumb APs
for i in firewall dnsmasq odhcpd; do
  if /etc/init.d/"$i" enabled; then
    /etc/init.d/"$i" disable
    /etc/init.d/"$i" stop
  fi
done


# Now switch the lan interface to DHCP client

uci set network.lan.proto='dhcp'
uci delete network.wan
uci delete network.wan6
uci delete network.lan.ipaddr
uci delete network.lan.netmask

# change the host name to "WifiAP"

uci set system.@system[0].hostname=$1


echo '#####################################################################'
echo 'the script has disabled firewall, dns and dhcp server on this device'
echo 'and switched the protocol of the lan interface to dhcp client'
echo 'you can now connect the LAN port of this device to the LAN port'
echo 'of your main Router. Check the IP address of the WifiAP system'
echo 'and connect to that new IP address in order to run the'
echo 'second script. This device is now rebooting'
echo 'the host name of the device is now WifiAP, so you might also'
echo 'try ping WifiAP or ssh WifiAP or the like'
echo '#####################################################################'

WIFI_NAME_0="OpenWrt-2.4G"
WIFI_PWD_0="xmh961028"
WIFI_RADIO_0=radio0
WIFI_CHANNEL_0=1
WIFI_MOBDOMAIN_0='1111'

WIFI_NAME_1="OpenWrt"
WIFI_PWD_1="xmh961028"
WIFI_RADIO_1=radio1
WIFI_CHANNEL_1=36
WIFI_MOBDOMAIN_1='2222'

# install the wpad full package

# opkg update
# opkg remove wpad*
# opkg install --force-overwrite wpad-openssl
# opkg install luci-app-dawn

# delete the "OpenWrt" radios

uci delete wireless.default_radio0
uci delete wireless.default_radio1

# create the AP Wifi 2.4G

uci set wireless.wifinet0=wifi-iface
uci set wireless.wifinet0.device=$WIFI_RADIO_0
uci set wireless.wifinet0.mode='ap'
uci set wireless.wifinet0.ssid=$WIFI_NAME_0
uci set wireless.wifinet0.encryption='psk2'
uci set wireless.wifinet0.key=$WIFI_PWD_0
uci set wireless.wifinet0.ieee80211r='1'
uci set wireless.wifinet0.mobility_domain=$WIFI_MOBDOMAIN_0
uci set wireless.wifinet0.reassociation_deadline='20000'
uci set wireless.wifinet0.ft_over_ds='0'
uci set wireless.wifinet0.ft_psk_generate_local='1'
uci set wireless.wifinet0.network='lan'
uci set wireless.wifinet0.bss_transition='1'
uci set wireless.wifinet0.wnm_sleep_mode='1'
uci set wireless.wifinet0.time_advertisement='2'
uci set wireless.wifinet0.time_zone='GMT0'
uci set wireless.wifinet0.ieee80211k='1'
uci set wireless.wifinet0.rrm_neighbor_report='1'
uci set wireless.wifinet0.rrm_beacon_report='1'
uci set "wireless.$WIFI_RADIO_0.htmode"='HT20'
uci set "wireless.$WIFI_RADIO_0.band"='2g'
uci set "wireless.$WIFI_RADIO_0.channel"=$WIFI_CHANNEL_0
uci set "wireless.$WIFI_RADIO_0.country"='AU'
uci delete "wireless.$WIFI_RADIO_0.disabled"

# create the AP Wifi 5G

uci set wireless.wifinet1=wifi-iface
uci set wireless.wifinet1.device=$WIFI_RADIO_1
uci set wireless.wifinet1.mode='ap'
uci set wireless.wifinet1.ssid=$WIFI_NAME_1
uci set wireless.wifinet1.encryption='psk2'
uci set wireless.wifinet1.key=$WIFI_PWD_1
uci set wireless.wifinet1.ieee80211r='1'
uci set wireless.wifinet1.mobility_domain=$WIFI_MOBDOMAIN_1
uci set wireless.wifinet1.reassociation_deadline='20000'
uci set wireless.wifinet1.ft_over_ds='0'
uci set wireless.wifinet1.ft_psk_generate_local='1'
uci set wireless.wifinet1.network='lan'
uci set wireless.wifinet1.bss_transition='1'
uci set wireless.wifinet1.wnm_sleep_mode='1'
uci set wireless.wifinet1.time_advertisement='2'
uci set wireless.wifinet1.time_zone='GMT0'
uci set wireless.wifinet1.ieee80211k='1'
uci set wireless.wifinet1.rrm_neighbor_report='1'
uci set wireless.wifinet1.rrm_beacon_report='1'
uci set "wireless.$WIFI_RADIO_1.htmode"='VHT80'
uci set "wireless.$WIFI_RADIO_1.band"='5g'
uci set "wireless.$WIFI_RADIO_1.channel"=$WIFI_CHANNEL_1
uci set "wireless.$WIFI_RADIO_1.country"='AU'
uci delete "wireless.$WIFI_RADIO_1.disabled"   

uci commit

# wifi down
# /etc/init.d/wpad restart
# wifi up

# remove the firewall config

mv /etc/config/firewall /etc/config/firewall.unused

# modify broadcast_ip

sed -i 's/10.0.0.255/192.168.5.255/' /etc/config/dawn

# restart dawn
# /etc/init.d/dawn restart

# reboot the device

reboot