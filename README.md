
最近切换到了 Rime 输入法, 个人的简单配置.

主要参考以下几个内容进行

1. [Rime 输入法指北](https://jiz4oh.com/2020/10/how-to-use-rime)
2. [RimeWithSchemata](https://github.com/rime/home/wiki/RimeWithSchemata)
3. [Rime/小狼豪/鼠须管 输入法配置记](https://chenhe.me/post/oh-my-rime/)
4. [Rime Squirrel 鼠须管输入法皮肤效果](https://ssnhd.github.io/2022/01/11/rime-skin/)
5. [简单安利 Rime 输入法](https://www.manjusaka.blog/posts/2020/01/28/simple-config-for-rime-input/index.html)
6. [致第一次安装RIME的你](https://www.zybuluo.com/eternity/note/81763)
7. [最新版 Rime 输入法使用 (2022 更新)](https://jdhao.github.io/2019/02/18/rime_configuration_intro/)
8. [Rime Squirrel 鼠须管输入法配置详解](https://ssnhd.github.io/2022/01/06/rime/)
9. [rime-double-pinyin](https://github.com/rime/rime-double-pinyin/blob/master/double_pinyin_mspy.schema.yaml)
10. [Rime/鼠须管/小狼毫 在完全中文输入下使用全套西文标点/英文标点](https://hellodk.cn/post/573)
11. [Rime 別樣設定，使用西文標點、[ ] 鍵換頁](https://gist.github.com/lotem/2334409)

主要的词库和配置参考, 使用 submodel 进行依赖, 根据心情更新.
- [Mintimate/oh-my-rime](https://github.com/Mintimate/oh-my-rime)
- [iDvel/rime-ice](https://github.com/iDvel/rime-ice)

个人主要使用的功能
- 双拼(微软双拼)
- 中文下用英文标点
- 之前输入法的快捷输入用 lua 脚本替代
    - lua 明显比快捷输入来的强大

配置文件位置
- 中州韵 `ibus-rime`: `~/.config/ibus/rime/`
- 小狼毫 `Weasel`: `%APPDATA%\Rime`，也可以通过“开始菜单＼小狼毫输入法＼用户文件夹”打开。
- 鼠须管 `Squirrel`:  `~/Library/Rime/`，也可以通过“系统输入法菜单／鼠须管／用户设置”打开。
