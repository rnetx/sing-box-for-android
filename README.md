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

你可以使用 Release 中构建好的 APK，也可以按照以下方法构建你的 APK

1. Fork 本项目
2. 本地生成 Android JKS 签名文件，并上传替换 app/android.jks (具体看下面)
3. 添加 Secrets
```
仓库 ==> settings ==> Secrets and variables ==> Actions ==> New repository secret

添加如下变量，设置 JKS 密码、别名、别名密码：(具体看下面)
KEYSTORE_PASS
ALIAS_NAME
ALIAS_PASS
```
4. 修改 build_libbox.sh，你可以改成自己想要的仓库和分支，这步不懂可以什么都不动
5. 允许 Action 发布到 Release
```
仓库 ==> settings ==> Actions ==> General ==> Workflow permissions ==> 选 Read and write permissions ==> Save

不设置会报错： Resource not accessible by integration
```
6. 在 Action 中触发构建

## 生成 Android JKS 文件

* 需要安装 Java 环境
```
keytool -genkeypair -alias <别名 ALIAS_NAME> -keyalg RSA -keysize 2048 -validity 3650 -storetype JKS -keystore android.jks
```
```
Enter keystore password: # 输入 JKS 密码 <KEYSTORE_PASS>
Re-enter new password: # 输入 JKS 密码 <KEYSTORE_PASS>
Enter the distinguished name. Provide a single dot (.) to leave a sub-component empty or press ENTER to use the default value in braces.
What is your first and last name?
  [Unknown]: # 基本信息，自用可以直接回车
What is the name of your organizational unit?
  [Unknown]: # 基本信息，自用可以直接回车
What is the name of your organization?
  [Unknown]: # 基本信息，自用可以直接回车
What is the name of your City or Locality?
  [Unknown]: # 基本信息，自用可以直接回车
What is the name of your State or Province?
  [Unknown]: # 基本信息，自用可以直接回车
What is the two-letter country code for this unit?
  [Unknown]: # 基本信息，自用可以直接回车
Is CN=Unknown, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown correct?
  [no]:  yes # 填 yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA384withRSA) with a validity of 3,650 days
        for: CN=Unknown, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown
Enter key password for <别名 ALIAS_NAME>
        (RETURN if same as keystore password): # 输入别名密码 <ALIAS_PASS>
Re-enter new password:  # 输入别名密码 <ALIAS_PASS>
```
