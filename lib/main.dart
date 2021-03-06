import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wyqFlutter/AppInit.dart';
import 'package:wyqFlutter/page/video/video_detail_page.dart';
import 'package:wyqFlutter/tab_navigation.dart';

void main() {
  runApp(MyApp());
  //Flutter沉浸式状态栏，Platform.isAndroid 判断是否是Android手机
  if (Platform.isAndroid) {
    // setSystemUIOverlayStyle:用来设置状态栏顶部和底部样式
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AppInit.init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          var widget = snapshot.connectionState == ConnectionState.done
              ? TabNavgation()
              : Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
          return GetMaterialAppWidget(child: widget);
        });
  }
}

class GetMaterialAppWidget extends StatefulWidget {
  final Widget child;

  GetMaterialAppWidget({Key key, this.child}) : super(key: key);

  @override
  _GetMaterialAppWidgetState createState() => _GetMaterialAppWidgetState();
}

class _GetMaterialAppWidgetState extends State<GetMaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: "EyePetizer",
    //   initialRoute: '/',
    //   routes: {
    //     '/':(BuildContext context) => widget.child,
    //   },
    // );
    return GetMaterialApp(
      title: "EyeVideo",
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>widget.child),
        GetPage(name: '/detail', page: () => VideoDetailPage()),
      ],
    );
  }
}









