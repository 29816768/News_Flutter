import 'package:wyqFlutter/http/Url.dart';
import 'package:wyqFlutter/model/discovery/topic_model.dart';
import 'package:wyqFlutter/viewmodel/base_list_viewmodel.dart';

class TopicPageViewModel extends BaseListViewModel<TopicItemModel,TopicModel>{

  @override
  String getUrl() {
    return Url.topicsUrl;
  }

  @override
  TopicModel getModel(Map<String, dynamic> json) {
    return TopicModel.fromJson(json);
  }
}