import 'package:flutter/widgets.dart';

Size? getSize(GlobalKey pageKey) {
  if (pageKey.currentContext == null) {
    return null;
  }
  final RenderBox renderBox =
      pageKey.currentContext!.findRenderObject() as RenderBox;
  Size size = renderBox.size;
  return size;
}
