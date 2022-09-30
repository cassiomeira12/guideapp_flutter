import 'package:flutter/widgets.dart';

const designSize = Size(360, 800);

extension Sizer on num {
  // double get pxWidth {
  //   final window = WidgetsBinding.instance.window;
  //   Size sizer = window.physicalSize / window.devicePixelRatio;
  //   return this * (sizer.width / designSize.width);
  // }

  // double get pxHeight {
  //   final window = WidgetsBinding.instance.window;
  //   Size sizer = window.physicalSize / window.devicePixelRatio;
  //   num statusBar = MediaQueryData.fromWindow(window).viewPadding.top;
  //   num screenHeight = sizer.height - statusBar;
  //   return this * (screenHeight / designSize.height);
  // }

  // double get pxSize {
  //   if (pxHeight < pxWidth) {
  //     return pxHeight.toInt().toDouble();
  //   } else {
  //     return pxWidth.toInt().toDouble();
  //   }
  // }

  double get pxW {
    final window = WidgetsBinding.instance.window;
    return (this / 100) * MediaQueryData.fromWindow(window).size.width;
  }

  double get pxH {
    final window = WidgetsBinding.instance.window;
    return (this / 100) * MediaQueryData.fromWindow(window).size.height;
  }
}
