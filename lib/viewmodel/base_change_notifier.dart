import 'package:flutter/material.dart';
import 'package:wyqFlutter/widget/loading_state_widget.dart';

class BaseChangNotifier with ChangeNotifier{
  ViewState viewState = ViewState.loading;

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