import 'package:flutter_hexun/entry/widget_info.dart';
import 'az_list/az_common.dart';

///
/// des:
///
class WidgetInfoSuspension extends ISuspensionBean {
  WidgetInfoSuspension({this.widgetInfo, this.tagIndex});

  final WidgetInfo widgetInfo;
  String tagIndex;

  @override
  String getSuspensionTag() => tagIndex;
}
