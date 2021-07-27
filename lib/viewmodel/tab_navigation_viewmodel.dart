import 'package:xiangxue_project/viewmodel/base_change_notifier.dart';

class TabNavigationViewMoel extends BaseChangNotifier{

  int currentIndex = 0;

  changeBottomTabIndex(int index){
    currentIndex = index;
    notifyListeners();
  }

}