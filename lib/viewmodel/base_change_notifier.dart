

import 'package:flutter/cupertino.dart';

class BaseChangNotifier with ChangeNotifier{

  // 页面销毁则不发送通知
  bool _dispose = false;

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }

  @override
  void notifyListeners() {
    if(!_dispose){
      super.notifyListeners();
    }
  }

}