import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:pt_liangyuetian/pages/main/main_page.dart';
import 'package:pt_liangyuetian/router/routers.dart';
import 'package:pt_liangyuetian/router/application.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pt liangyuetian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}
