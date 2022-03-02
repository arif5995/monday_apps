import 'package:flutter/material.dart';

Widget GridViewCustom(
    {required BuildContext context,
    int? cSpacing,
    int? count,
    int? height,
    int? mSpacing,
    required List<Widget> item}) {
  var _crossAxisSpacing = cSpacing;
  var _mainAxisSpacing = mSpacing!;
  var _screenWidth = MediaQuery.of(context).size.width;
  var _crossAxisCount = count;
  var _width = (_screenWidth - ((_crossAxisCount! - 1) * _crossAxisSpacing!)) /
      _crossAxisCount;
  var cellHeight = height;
  var _aspectRatio = _width / cellHeight!;

  return GridView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: _aspectRatio,
        crossAxisCount: _crossAxisCount,
        crossAxisSpacing: _crossAxisSpacing.toDouble(),
        mainAxisSpacing: _mainAxisSpacing.toDouble()),
    children: item,
  );
}
