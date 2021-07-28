import 'package:wyqFlutter/http/Url.dart';
import 'package:wyqFlutter/http/http_manager.dart';
import 'package:wyqFlutter/model/common_item.dart';
import 'package:wyqFlutter/model/issue_model.dart';
import 'package:wyqFlutter/utils/Toast.dart';
import 'package:wyqFlutter/viewmodel/base_change_notifier.dart';
import 'package:wyqFlutter/widget/loading_state_widget.dart';

class HomePageViewModel extends BaseChangNotifier {
  List<Item> bannerList = [];

  // 刷新数据
  void refresh() {
    HttpManager.getData(
      Url.feedUrl,
      success: (json) {
        IssueEntity model = IssueEntity.fromJson(json);
        bannerList = model.itemList;
        // 移除类型为 'banner2'
        bannerList.removeWhere((element) => element.type == 'banner2');
        viewState = ViewState.done;
      },
      fail: (e) {
        WyqToast.showError(e.toString());
      },
      complete: () => notifyListeners(),
    );
  }

  //错误重试
  retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }
}
