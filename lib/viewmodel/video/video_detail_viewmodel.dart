import 'package:wyqFlutter/http/Url.dart';
import 'package:wyqFlutter/http/http_manager.dart';
import 'package:wyqFlutter/model/common_item.dart';
import 'package:wyqFlutter/utils/Toast.dart';
import 'package:wyqFlutter/viewmodel/base_change_notifier.dart';
import 'package:wyqFlutter/widget/loading_state_widget.dart';

class VideoDetailViewModel extends BaseChangNotifier {
  List<Item> itemList = [];
  int _videoId;

  void loadVideoData(int id) {
    _videoId = id;
    // https://baobab.kaiyanapp.com/api/v4/video/related?id=266986
    HttpManager.requestData('${Url.videoRelatedUrl}$id').then((res) {
      Issue issue = Issue.fromJson(res);
      itemList = issue.itemList;
      viewState = ViewState.done;
    }).catchError((e) {
      WyqToast.showError(e.toString());
      viewState = ViewState.error;
    }).whenComplete(() => notifyListeners());
  }

  void retry() {
    viewState = ViewState.loading;
    notifyListeners();
    loadVideoData(_videoId);
  }
}
