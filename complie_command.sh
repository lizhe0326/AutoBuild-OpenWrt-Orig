git clone git@github.com:openwrt/openwrt.git
cd openwrt
git fetch -t
# git tag -l
# latest_tag=`git tag --sort=committerdate | tail -1`
latest_tag=v23.05.2
git checkout ${latest_tag}
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a


cp ../x86_64.config .config
make defconfig
make menuconfig
# ./scripts/diffconfig.sh > ../diffconfig

# cp ../K2P.config .config
# cp ../CR6608.config .config
# cp ../AX6S.config .config


# 二次编译：
# cd lede
# git pull
# ./scripts/feeds update -a
# ./scripts/feeds install -a
# make defconfig
# make download -j8
# make V=s -j$(nproc)


# 如果需要重新配置：
# rm -rf ./tmp && rm -rf .config
# make menuconfig
# make V=s -j$(nproc)