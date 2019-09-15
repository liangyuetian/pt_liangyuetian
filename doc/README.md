flutter 常用生命周期方法
### State的生命周期有四种状态：

created：当State对象被创建时候，State.initState方法会被调用；
initialized：当State对象被创建，但还没有准备构建时，State.didChangeDependencies在这个时候会被调用；
ready：State对象已经准备好了构建，State.dispose没有被调用的时候；
defunct：State.dispose被调用后，State对象不能够被构建

完整生命周期如下：

创建一个State对象时，会调用StatefulWidget.createState；
和一个BuildContext相关联，可以认为被加载了（mounted）；
调用initState；
调用didChangeDependencies；
经过上述步骤，State对象被完全的初始化了，调用build；
如果有需要，会调用didUpdateWidget；
如果处在开发模式，热加载会调用reassemble；
如果它的子树（subtree）包含需要被移除的State对象，会调用deactivate；
调用dispose,State对象以后都不会被构建；
当调用了dispose,State对象处于未加载（unmounted），已经被dispose的State对象没有办法被重新加载（remount）。
