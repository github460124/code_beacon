library font_social_flutter;

import 'package:flutter/widgets.dart';

class MyIcon {
  static const IconData qingtian = const _MyIconData(0xe689);

}

class _MyIconData extends IconData {
  const _MyIconData(int codePoint)
      : super(
    codePoint,
    fontFamily: 'MyIcon',
    //fontPackage: 'my_icon',
  );
}