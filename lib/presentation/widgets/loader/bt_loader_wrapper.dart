import 'package:bt_business/presentation/widgets/loader/bt_loader_indicator_widget.dart';
import 'package:flutter/cupertino.dart';

class BTLoaderWrapper extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const BTLoaderWrapper({
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          const Center(
            child: BTLoaderIndicatorWidget(),
          ),
      ],
    );
  }
}
