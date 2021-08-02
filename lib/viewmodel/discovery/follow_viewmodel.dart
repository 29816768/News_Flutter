import 'package:wyqFlutter/http/Url.dart';
import 'package:wyqFlutter/model/common_item.dart';
import 'package:wyqFlutter/viewmodel/base_list_viewmodel.dart';

class FollowViewModel extends BaseListViewModel<Item, Issue> {
  @override
  String getUrl() {
    return Url.followUrl;
  }

  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }
}