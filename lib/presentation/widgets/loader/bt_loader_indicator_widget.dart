import 'package:bt_business/presentation/styling/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BTLoaderIndicatorWidget extends StatefulWidget {
  const BTLoaderIndicatorWidget();

  @override
  State<BTLoaderIndicatorWidget> createState() => BTLoaderIndicatorWidgetState();
}

class BTLoaderIndicatorWidgetState extends State<BTLoaderIndicatorWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));
    _animationController?.repeat();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _animationController != null
        ? RotationTransition(
            turns: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(_animationController!),
            child: Image.asset(
              BTImages.loader,
            ),
          )
        : const SizedBox();
  }
}
