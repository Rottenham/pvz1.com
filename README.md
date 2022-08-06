# PVZ Wiki

PVZ Wiki 网址：https://wiki.crescb.com/

[PVZ Wiki](https://wiki.crescb.com/) 收录了与PVZ游戏内容与人物有关的知识、文献与资料。

## 提交你的编辑！

PVZ Wiki 基于 Markdown 文件格式，文件夹结构如下（以 [AvZ 键控教程](https://wiki.crescb.com/avz/)为例）：

```
└── avz/
    └── src/
        ├── SUMMARY.md
        └── basic/
            └── 各种md文件...
        └── advance/
            └── 各种md文件...
```

如果你要修改某个页面，你可以找到对应的```.md```文件，然后直接点击右上角的修改按钮。

GitHub 会自动地为你创建 fork ，之后你便可以发送 pull request。


## SUMMARY.md 的格式

SUMMARY.md 控制了左侧目录的显示。

如果你只是修改某个页面，你无需关心 SUMMARY.md。

如果你添加了一个页面，你需要在 SUMMARY.md 里添加对应信息，让它在目录里显示出来。

以 [AvZ 键控教程](https://wiki.crescb.com/avz/)为例：

```markdown
# Summary

[返回首页](../index.md)

[欢迎 👋](./index.md)

[目录](./catalogue.md)

# 基础
- [起步](./basic/start.md)

- [名称空间](./basic/namespace.md)

......

- [高级暂停](./basic/advance_pause.md)

- [跳帧](./basic/skip_tick.md)


# 进阶
- [操作队列](./advance/time_operate.md)

- [阻塞函数](./advance/wait_until.md)

......

- [变量内存管理](./advance/memory_manage.md)

- [插件](./advance/extension.md)
```

其中，``` - ```代表这是一个有序页面（会显示编号）；如果去掉的话，则不会计入编号。