#!/bin/bash
##### 除非你知道自己在干什么，否则什么都不要动 #####
# 想使用指定分支请修改链接，注意不要去掉后面的`sing-box`
git clone https://github.com/yaotthaha/sing-box-pub sing-box
###### !! 不要动 !! ######
cd sing-box
##########################
# 这里可以切换分支
git checkout dev-yaott
##########################
# https://github.com/yaotthaha/sing-box-pub@dev-next-yaott 编译 with_clash_ui 需要，其他分支可以注释掉 #########
# git submodule init
# git submodule update
make init_yacd
####################
# 这里可以修改 tags
tags="with_dhcp,with_lwip,with_gvisor,with_v2ray_api,with_quic,with_wireguard,with_utls,with_reality_server,with_clash_api,with_grpc,with_ech,with_proxyprovider,with_ruleprovider,with_clash_dashboard"
####################
###### !! 不要动 !! ######
make lib_install
version=$(CGO_ENABLED=0 go run ./cmd/internal/read_tag)
CGO_ENABLED=1 gomobile bind -v -androidapi 21 -javapkg=io.nekohasekai -libname=box -tags ${tags} -ldflags "-X github.com/sagernet/sing-box/constant.Version=${version} -buildid=" ./experimental/libbox
##########################
