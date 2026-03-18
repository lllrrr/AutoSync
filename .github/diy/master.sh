#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}

git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall && mv -n openwrt-passwall/luci-app-passwall ./; rm -rf openwrt-passwall
#sed -i 's/PassWall/通行证/g' luci-app-passwall/po/zh-cn/passwall.po
sed -i "s/option start_delay '60'/option start_delay '5'/g" luci-app-passwall/root/usr/share/passwall/0_default_config
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall2 && mv -n openwrt-passwall2/luci-app-passwall2 ./; rm -rf openwrt-passwall2
#sed -i 's/msgid "PassWall 2"/msgid "通行证2"/g' luci-app-passwall2/po/zh-cn/passwall2.po
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages && mvdir openwrt-passwall-packages
git clone --depth 1 https://github.com/fw876/helloworld && mv -n helloworld/{luci-app-ssr-plus,dns2socks-rust,dns2tcp,gn,lua-neturl,redsocks2,trojan} ./; rm -rf helloworld
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush
sed -i "s#<br /><br />If you encounter any issues while using it, please submit them here.*#'));#g" luci-app-wechatpush/htdocs/luci-static/resources/view/wechatpush/config.js
sed -i "s#<br /><br />If you encounter any issues while using it, please submit them here:##g" luci-app-wechatpush/po/zh_Hans/wechatpush.po
sed -i "s#<br /><br />如果你在使用中遇到问题，请到这里提交：##g" luci-app-wechatpush/po/zh_Hans/wechatpush.po
sed -i 's/ OpenWrt 上/设备上/g' luci-app-wechatpush/po/zh_Hans/wechatpush.po
#git clone -b openwrt-18.06 --depth 1 https://github.com/tty228/luci-app-wechatpush luci-app-serverchan
git clone --depth 1 https://github.com/gaoyaxuan/luci-app-pushbot
git clone --depth 1 https://github.com/sbwml/luci-app-airconnect airconnect1 && mv -n airconnect1/*airconnect ./; rm -rf airconnect1
#git clone --depth 1 https://github.com/CC13594759/luci-app-airconnect airconnect1 && mv -n airconnect1/*airconnect ./; rm -rf airconnect1 lua版本
#git clone --depth 1 https://github.com/sbwml/luci-app-alist alist1 && mv -n alist1/*alist ./; rm -rf alist1
git clone --depth 1 https://github.com/sbwml/luci-app-openlist2 openlist1 && mv -n openlist1/*openlist2 ./; rm -rf openlist1
#git clone --depth 1 https://github.com/lmq8267/luci-app-alist alist1 && mv -n alist1/*alist ./; rm -rf alist1
git clone --depth 1 https://github.com/sbwml/luci-app-filemanager
#git clone --depth 1 https://github.com/QiuSimons/openwrt-mos && mv -n openwrt-mos/luci-app-mosdns ./ ; rm -rf openwrt-mos
git clone --depth 1 https://github.com/sbwml/luci-app-mentohust mentohust1 && mv -n mentohust1/*mentohust ./; rm -rf mentohust1
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns openwrt-mos && mv -n openwrt-mos/{*mosdns,v2dat} ./; rm -rf openwrt-mos
git clone --depth 1 https://github.com/sbwml/luci-app-qbittorrent qbittorrent1 && mv -n qbittorrent1/{*qbittorrent,qt*,rb*} ./; rm -rf qbittorrent1
git clone --depth 1 https://github.com/teleostnacl/luci-app-qbittorrent-static qbittorrent-static1 && mv -n qbittorrent-static1/*qbittorrent* ./; rm -rf qbittorrent-static1
git clone --depth 1 https://github.com/sbwml/luci-app-quickfile quickfile1 && mv -n quickfile1/*quickfile ./; rm -rf quickfile1
git clone --depth 1 https://github.com/sbwml/luci-app-ramfree
git clone --depth 1 https://github.com/sbwml/luci-app-smbuser
git clone --depth 1 https://github.com/sbwml/luci-app-webdav
git clone -b 25.x --depth 1 https://github.com/sbwml/packages_lang_golang golang
#sed -i "s#GO_VERSION_PATCH:=6#GO_VERSION_PATCH:=7#g" golang/golang/Makefile
#sed -i "s#58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059#178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a#g" golang/golang/Makefile
#!git clone --depth 1 https://github.com/sbwml/packages_utils_containerd containerd
#!git clone --depth 1 https://github.com/sbwml/packages_utils_docker docker
#!git clone --depth 1 https://github.com/sbwml/packages_utils_dockerd dockerd
#!git clone --depth 1 https://github.com/sbwml/packages_utils_runc runc
git clone --depth 1 https://github.com/immortalwrt/homeproxy luci-app-homeproxy
#sed -i "s#HomeProxy#家庭代理#g" luci-app-homeproxy/root/usr/share/luci/menu.d/luci-app-homeproxy.json
git clone --depth 1 https://github.com/vernesong/OpenClash && mv -n OpenClash/luci-app-openclash ./; rm -rf OpenClash
#sed -i 's/msgstr "OpenClash"/msgstr "OpenClash"/g' luci-app-openclash/po/zh-cn/openclash.zh-cn.po
git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
#sed -i '52,54d' luci-app-oaf/luasrc/model/cbi/appfilter/feature.lua
git clone --depth 1 https://github.com/lisaac/luci-app-diskman diskman && mv -n diskman/applications/luci-app-diskman ./; rm -rf diskman
#git clone --depth 1 https://github.com/lisaac/luci-app-dockerman dockerman && mv -n dockerman/applications/luci-app-dockerman ./; rm -rf dockerman
#sed -i 's/40)/45)/g' luci-app-dockerman/luasrc/controller/dockerman.lua
#sed -i '21,22d' luci-app-dockerman/luasrc/model/cbi/dockerman/overview.lua
#sed -i '/auto_start/d' luci-app-dockerman/root/etc/uci-defaults/luci-app-dockerman
#sbwml for nft
#*git clone --depth 1 https://github.com/sbwml/luci-app-dockerman
##git clone --depth 1 https://github.com/gitbruc/luci-app-dockerman
#!git clone --depth 1 https://github.com/sirpdboy/luci-app-dockerman dockerman1 && mv -n dockerman1/luci-app-dockerman ./; rm -rf dockerman1
#!git clone --depth 1 https://github.com/lisaac/luci-lib-docker libdocker && mv -n libdocker/collections/luci-lib-docker ./; rm -rf libdocker
##git clone --depth 1 https://github.com/sbwml/luci-theme-argon argon1 && mv -n argon1/luci-theme-argon ./; rm -rf argon1
##sed -i '23d' luci-theme-argon/luasrc/view/themes/argon/footer.htm
##sed -i '23d' luci-theme-argon/luasrc/view/themes/argon/footer_login.htm
#Jerry版本
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
##sed -i '23,30d' luci-theme-argon/luasrc/view/themes/argon/footer.htm
##sed -i '24,25d' luci-theme-argon/luasrc/view/themes/argon/footer_login.htm
sed -i '22,29d' luci-theme-argon/ucode/template/themes/argon/footer.ut
sed -i "s#{{ version.disturl }}##g" luci-theme-argon/ucode/template/themes/argon/footer.ut
sed -i "s#{{ version.distname }} {{ version.distversion }}-{{ version.distrevision }}#R8.3.19.0410#g" luci-theme-argon/ucode/template/themes/argon/footer.ut
sed -i '23,24d' luci-theme-argon/ucode/template/themes/argon/footer_login.ut
sed -i "s#{{ version.disturl }}##g" luci-theme-argon/ucode/template/themes/argon/footer_login.ut
sed -i "s#{{ version.distname }} {{ version.distversion }}-{{ version.distrevision }}#R8.3.19.0410#g" luci-theme-argon/ucode/template/themes/argon/footer_login.ut
#Jerry版本
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth 1 https://github.com/eamonxg/luci-theme-aurora
git clone --depth 1 https://github.com/eamonxg/luci-app-aurora-config
git clone --depth 1 https://github.com/Beomjun/luci-theme-smart
git_sparse_clone master "https://github.com/x-wrt/com.x-wrt" "x-wrt" luci-app-wizard luci-app-fakemesh
#git clone --depth 1 https://github.com/kiddin9/luci-app-wizard
#git_sparse_clone main "https://github.com/kiddin9/kwrt-packages" "kwrt-packages" luci-app-bypass
git clone --depth 1 https://github.com/kiddin9/luci-app-dnsfilter
#sed -i 's/ipset/dnsmasq_full_ipset/g' luci-app-dnsfilter/Makefile
git clone --depth 1 https://github.com/kiddin9/luci-app-timewol
git clone --depth 1 https://github.com/animegasan/luci-app-wolplus
git clone --depth 1 https://github.com/isalikai/luci-app-owq-wol
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns smartdns
git clone --depth 1 https://github.com/pymumu/luci-app-smartdns
sed -i '1711,1734d' luci-app-smartdns/htdocs/luci-static/resources/view/smartdns/smartdns.js
#git clone --depth 1 https://github.com/yichya/luci-app-xray
git clone --depth 1 https://github.com/liudf0716/luci-app-xfrpc
git clone -b dev --depth 1 https://github.com/justice2001/luci-app-multi-frpc
git clone --depth 1 https://github.com/lmq8267/luci-app-caddy caddy1 && mv -n caddy1/luci-app-caddy ./; rm -rf caddy1
git clone --depth 1 https://github.com/lmq8267/luci-app-cloudflared cloudflared1 && mv -n cloudflared1/luci-app-cloudflared ./; rm -rf cloudflared1
#git clone --depth 1 https://github.com/lmq8267/luci-app-easytier easytier1 && mv -n easytier1/*easytier ./; rm -rf easytier1
git clone --depth 1 https://github.com/EasyTier/luci-app-easytier easytier1 && mv -n easytier1/*easytier ./; rm -rf easytier1
sed -i '5,9d' luci-app-easytier/luasrc/model/cbi/easytier.lua
git clone --depth 1 https://github.com/lmq8267/luci-app-vnt vnt1 && mv -n vnt1/*vnt* ./; rm -rf vnt1
sed -i '5d' luci-app-vnt/luasrc/model/cbi/vnt.lua
#git clone --depth 1 https://github.com/whzhni1/luci-app-vnt vnt2 && mv -n vnt2/*vnt* ./; rm -rf vnt2
git clone --depth 1 https://github.com/sirpdboy/luci-app-taskplan taskplan1 && mv -n taskplan1/luci-app-taskplan ./; rm -rf taskplan1
#git clone --depth 1 https://github.com/sirpdboy/luci-app-timecontrol timecontrol1 && mv -n timecontrol1/luci-app-timecontrol ./; rm -rf timecontrol1
#sed -i 's#..translate("Suggested feedback:.*##g' luci-app-timecontrol/luasrc/model/cbi/timecontrol.lua
git clone --depth 1 https://github.com/gaobin89/luci-app-timecontrol timecontrol2 && mv -n timecontrol2/luci-app-timecontrol ./; rm -rf timecontrol2
sed -i "s#IPv4/IPv6') + '<br/>' +#IPv4/IPv6'));#g" luci-app-timecontrol/htdocs/luci-static/resources/view/timecontrol/rules.js
#sed -i "229,230d" luci-app-timecontrol/htdocs/luci-static/resources/view/timecontrol/rules.js
sed -i "501d" luci-app-timecontrol/htdocs/luci-static/resources/view/timecontrol/rules.js
git clone --depth 1 https://github.com/sirpdboy/luci-app-adguardhome adguardhome1 && mv -n adguardhome1/luci-app-adguardhome ./; rm -rf adguardhome1
#git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome adguardhome1 && mv -n adguardhome1/luci-app-adguardhome ./; rm -rf adguardhome1
#git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome adguardhome1 && mv -n adguardhome1/luci-app-adguardhome ./; rm -rf adguardhome1
#git clone --depth 1 https://github.com/xiaoxiao29/luci-app-adguardhome adguardhome2 && mv -n adguardhome2/{AdGuardHome,luci-app-adguardhome} ./; rm -rf adguardhome2
#git clone --depth 1 https://github.com/w9315273/luci-app-adguardhome
git clone --depth 1 https://github.com/sirpdboy/luci-app-advanced
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus
git clone --depth 1 https://github.com/sirpdboy/luci-app-chatgpt-web
git clone --depth 1 https://github.com/sirpdboy/luci-app-cupsd cupsd1 && mv -n cupsd1/*cups* ./; rm -rf cupsd1
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddns-go1 && mv -n ddns-go1/*ddns-go ./; rm -rf ddns-go1
rm -rf luci-app-ddns-go/root/etc/config
#sed -i "s#statusView,#statusView);#g" luci-app-ddns-go/htdocs/luci-static/resources/view/ddns-go/config.js
#sed -i '283,292d' luci-app-ddns-go/htdocs/luci-static/resources/view/ddns-go/config.js
#sed -i '222,231d' luci-app-ddns-go/htdocs/luci-static/resources/view/ddns-go/log.js
git clone --depth 1 https://github.com/sirpdboy/luci-app-eqosplus
sed -i 's#..translate("Suggested feedback:.*##g' luci-app-eqosplus/luasrc/model/cbi/eqosplus.lua
git clone --depth 1 https://github.com/sirpdboy/luci-app-netdata
git clone --depth 1 https://github.com/sirpdboy/luci-app-netwizard netwizard1 && mv -n netwizard1/luci-app-netwizard ./; rm -rf netwizard1
#sed -i 's#..translate("For specific usage,.*# )#g' luci-app-netwizard/luasrc/model/cbi/netwizard/netwizard.lua
git clone --depth 1 https://github.com/sirpdboy/netspeedtest netspeedtest1 && mv -n netspeedtest1/{*speedtest*,homebox} ./; rm -rf netspeedtest1
#git clone --depth 1 https://github.com/muink/luci-app-netspeedtest
#git clone --depth 1 https://github.com/gdy666/luci-app-lucky lucky1 && mv -n lucky1/*lucky ./; rm -rf lucky1
#git clone --depth 1 https://github.com/0x5826/luci-app-lucky lucky1 && mv -n lucky1/*lucky ./; rm -rf lucky1
git clone --depth 1 https://github.com/sirpdboy/luci-app-lucky lucky1 && mv -n lucky1/*lucky ./; rm -rf lucky1
sed -i '143,152d' luci-app-lucky/htdocs/luci-static/resources/view/lucky/config.js
git clone --depth 1 https://github.com/sirpdboy/luci-app-parentcontrol
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp partexp1 && mv -n partexp1/luci-app-partexp ./; rm -rf partexp1
#sed -i 's#<br/>For specific usage,.*# )#g' luci-app-partexp/luasrc/model/cbi/partexp/global.lua
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice poweroffdevice1 && mv -n poweroffdevice1/luci-app-poweroffdevice ./; rm -rf poweroffdevice1
git clone --depth 1 https://github.com/sirpdboy/luci-app-watchdog watchdog1 && mv -n watchdog1/*watchdog ./; rm -rf watchdog1
#替换通配
sed -i "s#<br /><br />If you encounter any issues while using it, please submit them here.*#'));#g" luci-app-watchdog/htdocs/luci-static/resources/view/watchdog/basic.js
sed -i "s#\[ statusView ,#statusView);#g" luci-app-watchdog/htdocs/luci-static/resources/view/watchdog/basic.js
#sed -i '97,107d' luci-app-watchdog/htdocs/luci-static/resources/view/watchdog/basic.js
#sed -i '96,105d' luci-app-watchdog/htdocs/luci-static/resources/view/watchdog/log.js
sed -i "s#<br /><br />If you encounter any issues while using it, please submit them here:##g" luci-app-watchdog/po/zh_Hans/watchdog.po
sed -i "s#<br /><br />如果你在使用中遇到问题，请到这里提交：##g" luci-app-watchdog/po/zh_Hans/watchdog.po
sed -i 's/openwrt的/设备的/g' luci-app-watchdog/po/zh_Hans/watchdog.po
sed -i "s/option enable '0'/option enable '1'/g" watchdog/files/watchdog.config
#sed -i "s/1,/44,/g" luci-app-watchdog/root/usr/share/luci/menu.d/luci-app-watchdog.json
#sed -i 's|"/tmp/watchdog/\*": \[ "write" \]|"/tmp/watchdog/*": [ "write" ],|g' luci-app-watchdog/root/usr/share/rpcd/acl.d/luci-app-watchdog.json
git clone --depth 1 https://github.com/sirpdboy/luci-theme-kucat
git clone --depth 1 https://github.com/sirpdboy/luci-app-kucat-config
git clone --depth 1 https://github.com/sirpdboy/luci-theme-opentopd
#git clone --depth 1 https://github.com/asvow/luci-app-tailscale
git clone --depth 1 https://github.com/Jaykwok2999/luci-app-tailscale tailscale1 && mv -n tailscale1/*tailscale ./; rm -rf tailscale1
git clone --depth 1 https://github.com/Thaolga/openwrt-nekobox && mv -n openwrt-nekobox/luci-app-nekobox ./; rm -rf openwrt-nekobox
#git clone --depth 1 https://github.com/fcshark-org/openwrt-fchomo mihomo1 && mv -n mihomo1/{mihomo,luci-app-fchomo} ./; rm -rf mihomo1
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki && mv -n OpenWrt-nikki/*nikki ./; rm -rf OpenWrt-nikki
sed -i 's/<a href="https:\/\/github\.com\/nikkinikki-org\/OpenWrt-nikki\/wiki" target="_blank">${_(\x27How To Use\x27)}<\/a>//g' luci-app-nikki/htdocs/luci-static/resources/view/nikki/app.js
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-momo && mv -n OpenWrt-momo/*momo ./; rm -rf OpenWrt-momo
git clone --depth 1 https://github.com/laipeng668/luci-app-gecoosac gecoosac1 && mv -n gecoosac1/*gecoosac ./; rm -rf gecoosac1
git clone --depth 1 https://github.com/ophub/luci-app-amlogic amlogic1 && mv -n amlogic1/luci-app-amlogic ./; rm -rf amlogic1
git clone --depth 1 https://github.com/clion007/adss adss1 && mv -n adss1/*-adss ./; rm -rf adss1
git clone --depth 1 https://github.com/QiuSimons/openwrt-natflow natflow1 && mv -n natflow1/natflow ./; rm -rf natflow1
#git clone --depth 1 https://github.com/QiuSimons/luci-app-dae dae1 && mv -n dae1/*dae ./; rm -rf dae1
#git clone --depth 1 https://github.com/QiuSimons/luci-app-daed daed1 && mv -n daed1/*daed ./; rm -rf daed1
git clone --depth 1 https://github.com/sudo-bai/luci-app-cloud-control cloud-control1 && mv -n cloud-control1/*cloud-control ./; rm -rf cloud-control1
#!git clone --depth 1 https://github.com/EkkoG/openwrt-natmap natmap
#!git clone --depth 1 https://github.com/EkkoG/luci-app-natmap
git clone --depth 1 https://github.com/muink/openwrt-natmapt natmapt
git clone --depth 1 https://github.com/muink/luci-app-natmapt
git clone --depth 1 https://github.com/muink/openwrt-stuntman stuntman
git clone --depth 1 https://github.com/muink/openwrt-rgmac rgmac
git clone --depth 1 https://github.com/muink/luci-app-change-mac
sed -i "s#MAC 地址随机化#MAC随机化#g" luci-app-change-mac/po/zh-cn/change-mac.po
git clone --depth 1 https://github.com/newadev/luci-app-arcma arcma1 && mv -n arcma1/*arcma ./; rm -rf arcma1
sed -i "s#自动 MAC 地址随机化#MAC随机化#g" luci-app-arcma/po/zh-cn/arcma.po
git clone --depth 1 https://github.com/muink/luci-app-tinyfilemanager
git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf
git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status
git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-status-mini
git clone --depth 1 https://github.com/gSpotx2f/luci-app-disks-info
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector internet-detector1 && mv -n internet-detector1/*internet-detector* ./; rm -rf internet-detector1
git clone --depth 1 https://github.com/gSpotx2f/luci-app-interfaces-statistics
git clone --depth 1 https://github.com/gSpotx2f/luci-app-temp-status
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic
sed -i "s#<br/>' +#'));#g" luci-app-unblockneteasemusic/htdocs/luci-static/resources/view/unblockneteasemusic/config.js
sed -i '77d' luci-app-unblockneteasemusic/htdocs/luci-static/resources/view/unblockneteasemusic/config.js
sed -i "s#解除网易云音乐播放限制#网易云解锁#g" luci-app-unblockneteasemusic/root/usr/share/luci/menu.d/luci-app-unblockneteasemusic.json
git clone --depth 1 https://github.com/brvphoenix/wrtbwmon wrtbwmon1 && mv -n wrtbwmon1/wrtbwmon ./; rm -rf wrtbwmon1
git clone --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon openwrt-wrtbwmon1 && mv -n openwrt-wrtbwmon1/luci-app-wrtbwmon ./; rm -rf openwrt-wrtbwmon1
#git clone --depth 1 https://github.com/gitbruc/openwrt-wrtbwmon openwrt-wrtbwmon1 && mv -n openwrt-wrtbwmon1/*wrtbwmon ./; rm -rf openwrt-wrtbwmon1
git clone --depth 1 https://github.com/animegasan/luci-app-droidmodem
git clone --depth 1 https://github.com/lvqier/luci-app-dnsmasq-ipset
#git clone --depth 1 https://github.com/chenmozhijin/turboacc turboacc1 && mv -n turboacc1/luci-app-turboacc ./; rm -rf turboacc1
#git clone -b package --depth 1 https://github.com/chenmozhijin/turboacc turboacc-packages
git clone --depth 1 https://github.com/lucikap/luci-app-nettask nettask1 && mv -n nettask1/*nettask ./; rm -rf nettask1
git clone --depth 1 https://github.com/torguardvpn/luci-app-easymesh
#git clone --depth 1 https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest cloudflarespeedtest1 && mv -n cloudflarespeedtest1/applications/luci-app-cloudflarespeedtest ./; rm -rf cloudflarespeedtest1
git clone --depth 1 https://github.com/stevenjoezhang/luci-app-cloudflarespeedtest
git clone --depth 1 https://github.com/linkease/nas-packages nas-packages1 && mv -n nas-packages1/network/services/* ./; rm -rf nas-packages1
git clone --depth 1 https://github.com/linkease/nas-packages-luci nas-packages-luci1 && mv -n nas-packages-luci1/luci/* ./; rm -rf nas-packages-luci1
git clone --depth 1 https://github.com/linkease/istore istore1 && mv -n istore1/luci/* ./; rm -rf istore1
git clone --depth 1 https://github.com/linkease/lcdsimple lcdsimple1 && mvdir lcdsimple1
git clone --depth 1 https://github.com/kiddin9/luci-app-syscontrol
git clone --depth 1 https://github.com/4IceG/luci-app-sms-tool sms-tool1 && mv -n sms-tool1/*sms-tool ./; rm -rf sms-tool1
git clone --depth 1 https://github.com/4IceG/luci-app-sms-tool-js sms-tool2 && mv -n sms-tool2/luci-app-sms-tool-js ./; rm -rf sms-tool2
git clone --depth 1 https://github.com/4IceG/luci-app-crontab-wizard crontab-wizard1 && mv -n crontab-wizard1/luci-app-crontab-wizard ./; rm -rf crontab-wizard1
git clone --depth 1 https://github.com/4IceG/luci-app-modemband modemband1 && mv -n modemband1/*modemband ./; rm -rf modemband1
git clone --depth 1 https://github.com/4IceG/luci-app-modemdata modemdata1 && mv -n modemdata1/luci-app-modemdata ./; rm -rf modemdata1
git clone --depth 1 https://github.com/timsaya/openwrt-bandix bandix1 && mv -n bandix1/*bandix ./bandix; rm -rf bandix1
git clone --depth 1 https://github.com/timsaya/luci-app-bandix bandix2 && mv -n bandix2/*bandix ./; rm -rf bandix2
#sed -i "s#Bandix 流量监控#流量监控#g" luci-app-bandix/po/zh-cn/bandix.po
#sed -i "s#Bandix DNS 监控#DNS 监控#g" luci-app-bandix/po/zh_Hans/bandix.po
#sed -i "s#Bandix 连接监控#连接监控#g" luci-app-bandix/po/zh_Hans/bandix.po
#sed -i "s#Bandix 流量监控#流量监控#g" luci-app-bandix/root/usr/share/luci/status/bandix.json
#sed -i "s#Bandix#流量监控#g" luci-app-bandix/root/usr/share/luci/menu.d/luci-app-bandix.json
sed -i '634,642d' luci-app-bandix/htdocs/luci-static/resources/view/bandix/settings.js
#sed -i '670,676d' luci-app-bandix/htdocs/luci-static/resources/view/bandix/settings.js
git clone --depth 1 https://github.com/qianlyun123/luci-app-modem
#git clone --depth 1 https://github.com/zzxym/luci-app-sdwan sdwan1 && mv -n sdwan1/*sdwan ./; rm -rf sdwan1
git clone --depth 1 https://github.com/iv7777/luci-app-authshield
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff
git clone --depth 1 https://github.com/animegasan/luci-app-ipinfo
git clone --depth 1 https://github.com/animegasan/luci-app-dnsleaktest
git clone --depth 1 https://github.com/alrescha79-cmd/luci-app-ipinfo-mod
git clone --depth 1 https://github.com/chenmozhijin/luci-app-socat socat1 && mv -n socat1/luci-app-socat ./; rm -rf socat1
git clone --depth 1 https://github.com/aurelius1688/luci-app-hardware-monitor hardware-monitor1 && mv -n hardware-monitor1/luci-app-hardware-monitor ./; rm -rf hardware-monitor1
git clone --depth 1 https://github.com/niki-no/luci-app-mydomain mydomain1 && mv -n mydomain1/luci-app-mydomain ./; rm -rf mydomain1
git clone --depth 1 https://github.com/LazuliKao/luci-app-portweaver portweaver1 && mv -n portweaver1/*portweaver ./; rm -rf portweaver1
git clone --depth 1 https://github.com/hxzlplp7/luci-app-argo
git clone --depth 1 https://github.com/hxzlplp7/luci-app-warp
git clone --depth 1 https://github.com/hxzlplp7/luci-app-socks-clash
git clone --depth 1 https://github.com/kuoruan/openwrt-upx upx1 && mv -n upx1/{ucl,upx} ./; rm -rf upx1
git clone --depth 1 https://github.com/davidu2003/luci-app-httping
git clone --depth 1 https://github.com/onchina/luci-app-nvr
git clone --depth 1 https://github.com/gaoderby/luci-app-kms kms1 && mv -n kms1/luci/applications/luci-app-vlmcsd kms1/package/network/vlmcsd ./; rm -rf kms1
sed -i "s#Vlmcsd KMS 服务器#KMS 服务器#g" luci-app-vlmcsd/po/zh_Hans/vlmcsd.po
git clone --depth 1 https://github.com/de-quenx/luci-app-netmonitor netmonitor1 && mv -n netmonitor1/luci-app-netmonitor ./; rm -rf netmonitor1
git clone --depth 1 https://github.com/hzy306016819/luci-app-openvpn-admin
git clone --depth 1 https://github.com/science2468/luci-app-hev-scoks5-tunnel
git clone --depth 1 https://github.com/MayflyDestiny/luci-app-mosdns-panel mosdns-panel1 && mv -n mosdns-panel1/luci-app-mosdns-panel ./; rm -rf mosdns-panel1
#git clone --depth 1 https://github.com/zouzonghao/luci-app-dufs
git clone --depth 1 https://github.com/findnr/findnr-feeds findnr1 && mv -n findnr1/{luci-*,cymfrp} ./; rm -rf findnr1
git clone --depth 1 https://github.com/LIKE2000-ART/luci-app-picoclaw picoclaw1 && mv -n picoclaw1/*picoclaw ./; rm -rf picoclaw1
git clone --depth 1 https://github.com/10000ge10000/luci-app-openclaw
git clone --depth 1 https://github.com/jimmyk1m/luci-app-autoredial
git clone --depth 1 https://github.com/Zesuy/luci-app-multi-login
git clone --depth 1 https://github.com/pengcong226/luci-app-easy-mwan3
git clone --depth 1 https://github.com/hzy306016819/luci-app-backup
git clone --depth 1 https://github.com/0x5826/luci-app-flowproxy flowproxy1 && mv -n flowproxy1/*flowproxy ./; rm -rf flowproxy1
git clone --depth 1 https://github.com/jlzsss/luci-app-sxray

git_sparse_clone openwrt-25.12 "https://github.com/immortalwrt/packages" "immpack" net/cdnspeedtest net/dae net/daed net/dufs net/rustdesk-server net/zerotier net/gost net/n2n
git_sparse_clone openwrt-25.12 "https://github.com/immortalwrt/luci" "immluci" applications/luci-app-autoreboot applications/luci-app-dae applications/luci-app-daed applications/luci-app-dufs applications/luci-app-rustdesk-server applications/luci-app-zerotier applications/luci-app-gost applications/luci-app-n2n
sed -i 's/system/services/g' luci-app-autoreboot/root/usr/share/luci/menu.d/luci-app-autoreboot.json
#!git_sparse_clone openwrt-24.10 "https://github.com/openwrt/packages" "24packages" net/curl
sed -i 's/default LIBCURL_MBEDTLS/default LIBCURL_OPENSSL/g' curl/Config.in
sed -i 's/title": "daed/title": "DAED/g' luci-app-daed\/root/usr/share/luci/menu.d/luci-app-daed\.json
#git_sparse_clone openwrt-24.10 "https://github.com/openwrt/luci" "24luci" modules/luci-lua-runtime
#!git_sparse_clone master "https://github.com/coolsnowwolf/packages" "ledepack" net/frp
#!git_sparse_clone master "https://github.com/coolsnowwolf/luci" "ledeluci" applications/luci-app-frpc applications/luci-app-frps
#!sed -i 's/Frp Setting/Frpc/g' luci-app-frpc/luasrc/controller/frp.lua
#!sed -i 's#internet.*#internet.")#g' luci-app-frps/luasrc/model/cbi/frps/common.lua
#!sed -i 's#internet.*#internet."#g' luci-app-frps/po/zh-cn/frps.po
#sed -i "s#<br/><a href=\"https://github.com/fatedier/frp\" target=\"_blank\">Github 项目地址</a>##g" luci-app-frps/po/zh-cn/frps.po
#git_sparse_clone other "https://github.com/Lienol/openwrt-package" "lienolother" lean/luci-app-autoreboot
#sed -i 's/system/services/g' luci-app-autoreboot/luasrc/controller/autoreboot.lua
#git_sparse_clone main "https://github.com/Lienol/openwrt-package" "lienol" luci-app-socat
#git_sparse_clone main "https://github.com/kenzok8/small-package/" "kenzok8" adguardhome luci-app-adguardhome

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\|net\|utils\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
*/Makefile

rm -rf ./*/.git ./*/.gitattributes ./*/.svn ./*/.github ./*/.gitignore create_acl_for_luci.err create_acl_for_luci.ok create_acl_for_luci.warn
exit 0

