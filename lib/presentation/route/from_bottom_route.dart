import 'package:flutter/material.dart';

const _TRANSITION_DURATION = Duration(milliseconds: 200);

class SlideFromBottomRoute extends PageRouteBuilder {
  SlideFromBottomRoute({
    required Widget page,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          reverseTransitionDuration: _TRANSITION_DURATION,
          transitionDuration: _TRANSITION_DURATION,
          transitionsBuilder:
              (_, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            final Widget transition = SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0.0, -1),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
            return transition;
          },
        );
}
