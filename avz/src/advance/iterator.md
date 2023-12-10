<!--
 * @Coding: utf-8
 * @Author: vector-wlc
 * @Date: 2022-06-30 11:10:57
 * @Description: 
-->
# 对象过滤迭代器 

**需要 AvZ 版本 >= 220630**

在对植物僵尸的数组进行遍历时，我们常常需要使用以下语句
```C++
int zombie_total = GetMainObject()->zombieTotal();
auto zombie_array = GetMainObject()->zombieArray();

for (int idx = 0; idx < zombie_total; ++idx) {
    if (!zombie_array[idx].isDisappeared() && !zombie_array[idx].isDead()) {
        if(zombie[idx].type() == HY_32){
            // some code
        }
    }
}
```

我们真正的处理代码实际上是在 "// some code" 部分，但是我们基本上都要编写以上那些基本视为定式(无用)的代码，
为了解决这个问题，AvZ 封装了对象过滤迭代器，BasicFilter 和 AliveFilter，一般情况下，AliveFilter
能够胜任绝大部分情况的任务，**它被设计用于仅仅遍历场地上活着的对象**。

```C++
AliveFilter<Zombie> zombie_filter;
for (auto&& zombie : zombie_filter) {
    if (zombie.type() == HY_32) {
        // some code
    }
}
```

仔细看上面这段代码，你会发现比之前的代码简单了非常多，
* 不用写获取内存数据的那两条代码了，而只需要创建一个过滤器即可
* 在迭代方面，不再需要使用普通的for循环了，而是直接使用更加简单明确的范围for循环
* 不用再写判断僵尸是否存活的相关代码了，而是直接书写功能判断代码

实际上，这个可以更简单，将上面两条语句压缩成为一条语句，但是压缩语句意味着是失去一些可读性为代价的，但是这个压缩还好，对可读性的改变不大，
在这里我只想说明一点，不要总是想着在性能不变的情况下压缩代码，除非你觉得别人在看你的代码时不会感觉很困惑。
写出一套可读性很好的代码也是水平的一种体现。
```C++
for (auto&& zombie : AliveFilter<Zombie>()) {
    if (zombie.type() == HY_32) {
        // some code
    }
}
```

这就是使用对象迭代器的亿些好处，除此之外，对象迭代器依然有其他功能，比如可将判断僵尸是否是红眼的代码写在过滤器的构造函数中
```C++
AliveFilter<Zombie> zombie_filter([](Zombie* zombie) {
    return zombie->type() == HY_32;
});

for (auto&& zombie : zombie_filter) {
    // some code
}
```
就像上文中说的，这段代码实际上就是把判断僵尸类型得代码写在了过滤器的构造函数中，这样看起来判断代码和功能代码就实现了分离，
可能有些人更喜欢这种写法，而且这种写法可能会更加充分的利用 C++ 标准库中的一些功能，这里不再深入探讨。

可能有些极端情况需要遍历已经死去的僵尸(为什么会有这样的需求，实际上我也不知道啥时候会有这样的需求)，AvZ 提供了 BasicFilter，
相比于 AliveFilter 会自动过滤掉死亡的僵尸，BasicFilter 则什么都没有做，他只是能普通的遍历数组中的对象。

```C++
BasicFilter<Zombie> zombie_filter;
for (auto&& zombie : zombie_filter) {
    if (!zombie.isDisappeared() && !zombie.isDead() && zombie.type() == HY_32) {
        // some code
    }
}
```

查看这段代码，你可能心里会想，这不就是最原始普通的遍历加上了一个范围for循环吗，好像确实如此，但是当你在构造函数中添加亿些条件看起来也许就不那么一样了
```C++
BasicFilter<Zombie> zombie_filter([](Zombie* zombie) {
    return !zombie->isDisappeared() && !zombie->isDead() && zombie->type() == HY_32;
});

for (auto&& zombie : zombie_filter) {
    // some code
}
```
**所以，请记住：BasicFilter 一样可以完成 AliveFilter 的任务，他是更加通用的对象过滤器**

为了方便使用，AvZ直接提供了以下三种对象过滤迭代器，他们都是全局变量
```C++
extern AliveFilter<Zombie> alive_zombie_filter;
extern AliveFilter<Plant> alive_plant_filter;
extern AliveFilter<Seed> alive_seed_filter;
extern AliveFilter<PlaceItem> alive_place_item_filter;
;
```

[上一篇 智能操作](./smart.md)

[目录](../catalogue.md)

[下一篇 变量内存管理](./memory_manage.md)