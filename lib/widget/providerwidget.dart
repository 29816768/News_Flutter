import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget child;

  final Function(T) onModelInit;
  final Widget Function(BuildContext context, T model, Widget child) builder;

  const ProviderWidget(
      {Key key,
      @required this.model,
      @required this.builder,
      this.onModelInit,
      this.child})
      : super(key: key);

  @override
  _ProviderWidgetState createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  T model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    if (widget.onModelInit != null && model != null) {
      widget.onModelInit(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => model,
        child: Consumer<T>(builder: widget.builder, child: widget.child));
  }
}
