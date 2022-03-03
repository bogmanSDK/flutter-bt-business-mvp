import 'package:flutter/material.dart';

abstract class BTLoaderAnimation {
  BTLoaderAnimation();

  Widget call(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return buildWidget(
      child,
      controller,
      alignment,
    );
  }

  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  );
}

class BTLoaderOpacityAnimation extends BTLoaderAnimation {
  BTLoaderOpacityAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: child,
    );
  }
}
