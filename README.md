# SFA

Experimental Android client for sing-box, the universal proxy platform.

## Documentation

https://sing-box.sagernet.org/installation/clients/sfa/

## License

```
Copyright (C) 2022 by nekohasekai <contact-sagernet@sekai.icu>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

In addition, no derivative work may use the name or imply association
with this application without prior consent.
```

Under the license, that forks of the app are not allowed to be listed on F-Droid or other app stores
under the original name.

## 用法

1. Fork 本项目
2. 本地生成 Android JKS 签名文件，并上传替换 app/android.jks (自己 Google)
3. 添加 Secrets
```
仓库 ==> settings ==> Secrets and variables ==> Actions ==> New repository secret

添加如下变量，设置 JKS 密码、别名、别名密码：(自己 Google)
KEYSTORE_PASS
ALIAS_NAME
ALIAS_PASS
```
4. 修改 build_libbox.sh，你可以改成自己想要的仓库和分支，这步不懂可以什么都不动
5. 在 Action 中触发构建
