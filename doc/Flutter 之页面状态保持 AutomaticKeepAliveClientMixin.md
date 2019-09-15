想要保持状态的页面必须是StatefullWidget，并且在相应的页面的state中混入AutomaticKeepAliveClientMixin类重写wantKeepAlive方法并返回true
```dart
class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}
class _MemberPageState extends State<MemberPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    print('初始化${this.widget.toStringShort()}');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('个人中心'),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
```