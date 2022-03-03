import 'dart:async';

import 'package:bt_business/presentation/styling/color.dart';
import 'package:bt_business/presentation/widgets/loader/bt_loader_animation.dart';
import 'package:bt_business/presentation/widgets/loader/bt_loader_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const _ANIMATION_DURATION = Duration(milliseconds: 230);

class BTLoader {
  bool userInteractions = false;

  Widget? _child;

  _BTLoaderOverlay? overlayEntry;
  GlobalKey<_BTLoaderContainerState>? _key;

  Widget? get child => _child;
  GlobalKey<_BTLoaderContainerState>? get key => _key;

  factory BTLoader() => _instance;
  static final BTLoader _instance = BTLoader._internal();

  BTLoader._internal() {
    userInteractions = false;
  }

  static BTLoader get instance => _instance;
  static bool get isShow => _instance.child != null;

  // Init
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (child == null) return const SizedBox();

      if (builder != null) {
        return builder(context, _BTLoaderOverlayWrapper(child: child));
      } else {
        return _BTLoaderOverlayWrapper(child: child);
      }
    };
  }

  static Future<void> show({
    bool? userInteraction = true,
  }) {
    return _instance._show(
      userInteraction: userInteraction,
    );
  }

  static Future<void> dismiss({
    bool animation = true,
  }) {
    return _instance._dismiss(animation);
  }

  Future<void> _show({
    bool? userInteraction,
  }) async {
    _instance.userInteractions = userInteraction ?? false;
    final bool animation = _child == null;
    if (_key != null) await dismiss(animation: false);

    final Completer<void> completer = Completer<void>();
    _key = GlobalKey<_BTLoaderContainerState>();
    _child = _BTLoaderContainer(
      key: _key,
      animation: animation,
      completer: completer,
    );
    _markNeedsBuild();
    return completer.future;
  }

  Future<void> _dismiss(bool animation) async {
    if (key != null && key?.currentState == null) {
      _reset();
      return;
    }

    return key?.currentState?.dismiss(animation).whenComplete(() {
      _reset();
    });
  }

  void _reset() {
    _child = null;
    _key = null;
    _markNeedsBuild();
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }
}

class _BTLoaderOverlayWrapper extends StatefulWidget {
  final Widget child;

  const _BTLoaderOverlayWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _BTLoaderOverlayWrapperState createState() =>
      _BTLoaderOverlayWrapperState();
}

class _BTLoaderOverlayWrapperState extends State<_BTLoaderOverlayWrapper> {
  late _BTLoaderOverlay _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = _BTLoaderOverlay(
      builder: (BuildContext context) =>
          BTLoader._instance.child ?? const SizedBox(),
    );
    BTLoader._instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          _BTLoaderOverlay(
            builder: (_) => widget.child,
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}

class _BTLoaderContainer extends StatefulWidget {
  final Completer<void>? completer;
  final bool animation;

  const _BTLoaderContainer({
    Key? key,
    this.completer,
    this.animation = true,
  }) : super(key: key);

  @override
  _BTLoaderContainerState createState() => _BTLoaderContainerState();
}

class _BTLoaderContainerState extends State<_BTLoaderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late bool _ignoring;

  bool get isPersistentCallbacks =>
      SchedulerBinding.instance?.schedulerPhase ==
      SchedulerPhase.persistentCallbacks;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    _ignoring = !BTLoader._instance.userInteractions;
    _animationController = AnimationController(
      vsync: this,
      duration: _ANIMATION_DURATION,
    )..addStatusListener((status) {
        final bool isCompleted = widget.completer?.isCompleted ?? false;
        if (status == AnimationStatus.completed && !isCompleted) {
          widget.completer?.complete();
        }
      });
    show(widget.animation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> show(bool animation) {
    if (isPersistentCallbacks) {
      final completer = Completer<void>();
      SchedulerBinding.instance?.addPostFrameCallback(
        (_) => completer.complete(
          _animationController
              .forward(from: animation ? 0 : 1)
              .whenComplete(() => null),
        ),
      );
      return completer.future;
    } else {
      return _animationController.forward(from: animation ? 0 : 1);
    }
  }

  Future<void> dismiss(bool animation) {
    if (isPersistentCallbacks) {
      final completer = Completer<void>();
      SchedulerBinding.instance?.addPostFrameCallback(
        (_) => completer.complete(
          _animationController
              .reverse(from: animation ? 1 : 0)
              .whenComplete(() => null),
        ),
      );
      return completer.future;
    } else {
      return _animationController.reverse(from: animation ? 1 : 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _animationController.value,
              child: _ignoring
                  ? AbsorbPointer(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: BTColors.backgroundMain,
                      ),
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            final anim = BTLoaderOpacityAnimation();
            return anim.buildWidget(
              const Center(
                child: BTLoaderIndicatorWidget(),
              ),
              _animationController,
              Alignment.center,
            );
          },
        ),
      ],
    );
  }
}

class _BTLoaderOverlay extends OverlayEntry {
  _BTLoaderOverlay({
    required WidgetBuilder builder,
  }) : super(builder: builder);

  @override
  void markNeedsBuild() {
    if (SchedulerBinding.instance?.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        super.markNeedsBuild();
      });
    } else {
      super.markNeedsBuild();
    }
  }
}
