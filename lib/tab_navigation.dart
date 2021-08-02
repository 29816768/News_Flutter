import 'package:flutter/material.dart';
import 'package:wyqFlutter/config/string.dart';
import 'package:wyqFlutter/page/discovery/discovery_page.dart';
import 'package:wyqFlutter/page/home/home_page.dart';
import 'package:wyqFlutter/utils/Toast.dart';
import 'package:wyqFlutter/viewmodel/tab_navigation_viewmodel.dart';
import 'package:wyqFlutter/widget/providerwidget.dart';

class TabNavgation extends StatefulWidget {
  @override
  _TabNavgationState createState() => _TabNavgationState();
}

class _TabNavgationState extends State<TabNavgation> {
  DateTime lastTime;
  Widget _currentBody = Container(color: Colors.blue);

  PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            body: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), //禁止viewpage滑动
              children: [
                // Container(color: Colors.blue),
                HomePage(),
                //Container(color: Colors.amber),
                DiscoveryPage(),
                Container(color: Colors.green),
                Container(color: Colors.deepOrangeAccent)
              ],
            ),
            bottomNavigationBar: ProviderWidget<TabNavigationViewMoel>(
              model: TabNavigationViewMoel(),
              builder: (context, model, child) {
                return BottomNavigationBar(
                  currentIndex: model.currentIndex,
                  //固定title
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xff000000),
                  unselectedItemColor: Color(0xff9a9a9a),
                  items: _item(),
                  onTap: (index){
                    if(model.currentIndex != index){
                      // 直接跳转不带动画，自动 setState
                      _pageController.jumpToPage(index);
                      model.changeBottomTabIndex(index);
                    }
                  },
                );
              },
            )));
  }

  //tab 图片
  List<BottomNavigationBarItem> _item() {
    return [
      _bottomItem(WyqString.home, 'images/ic_home_normal.png',
          'images/ic_home_selected.png'),
      _bottomItem(WyqString.discovery, 'images/ic_discovery_normal.png',
          'images/ic_discovery_selected.png'),
      _bottomItem(WyqString.hot, 'images/ic_hot_normal.png',
          'images/ic_hot_selected.png'),
      _bottomItem(WyqString.mine, 'images/ic_mine_normal.png',
          'images/ic_mine_selected.png'),
    ];
  }

  //tab Item
  _bottomItem(String title, String normal, String select) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          normal,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          select,
          width: 24,
          height: 24,
        ),
        label: title);
  }

  //退出
  Future<bool> _onWillPop() async {
    if (lastTime == null ||
        DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
      lastTime = DateTime.now();
      WyqToast.showTip(WyqString.exit_tip);
      return false;
    } else {
      //自动出栈
      return true;
    }
  }

  //tab切换
  _onTap(int index) {
    switch (index) {
      case 0:
        _currentBody = Container(color: Colors.blue);
        break;
      case 1:
        _currentBody = Container(color: Colors.amber);
        break;
      case 2:
        _currentBody = Container(color: Colors.green);
        break;
      case 3:
        _currentBody = Container(color: Colors.deepOrangeAccent);
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
