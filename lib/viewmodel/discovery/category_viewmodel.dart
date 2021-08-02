import 'package:wyqFlutter/http/Url.dart';
import 'package:wyqFlutter/http/http_manager.dart';
import 'package:wyqFlutter/model/discovery/category_model.dart';
import 'package:wyqFlutter/utils/Toast.dart';
import 'package:wyqFlutter/viewmodel/base_viewmodel.dart';
import 'package:wyqFlutter/widget/loading_state_widget.dart';

class CategoryViewModel extends BaseViewModel {
  List<CategoryModel> list = [];

  @override
  void refresh() async {
    HttpManager.getData(
      Url.categoryUrl,
      success: (result) {
        list = (result as List)
            .map((model) => CategoryModel.fromJson(model))
            .toList();
        viewState = ViewState.done;
      },
      fail: (e) {
        WyqToast.showError(e.toString());
        viewState = ViewState.error;
      },
      complete: () => notifyListeners(),
    );
  }
}