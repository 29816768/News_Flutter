import 'package:flutter/material.dart';
import 'package:wyqFlutter/viewmodel/home_page_viewmodel.dart';
import 'package:wyqFlutter/widget/home/banner_widget.dart';
import 'package:wyqFlutter/widget/loading_state_widget.dart';
import 'package:wyqFlutter/widget/providerwidget.dart';


class HomeBodyPage extends StatefulWidget {
  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<HomePageViewModel>(
        model: HomePageViewModel(),
        onModelInit: (model) => model.refresh(),
        builder: (context, model, child) {
          return LoadingStateWidget(
            viewState: model.viewState,
            retry: model.retry,
            child: _banner(model),
          );
        });
  }

  _banner(model){
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      // ClipRRect:对子组件进行圆角裁剪
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: BannerWidget(model: model),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
