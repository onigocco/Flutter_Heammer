import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

class GrassHeader extends Header {
  /// Key
  final Key key;

  final LinkHeaderNotifier linkNotifier = LinkHeaderNotifier();

  GrassHeader({
    this.key,
    bool enableHapticFeedback = false,
  }) : super(
          extent: 60.0,
          triggerDistance: 100.0,
          float: false,
          enableHapticFeedback: enableHapticFeedback,
          enableInfiniteRefresh: false,
          completeDuration: const Duration(milliseconds: 700),
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    // 不能为水平方向以及反向
    assert(axisDirection == AxisDirection.down,
        'Widget can only be vertical and cannot be reversed');
    linkNotifier.contentBuilder(
        context,
        refreshState,
        pulledExtent,
        refreshTriggerPullDistance,
        refreshIndicatorExtent,
        axisDirection,
        float,
        completeDuration,
        enableInfiniteRefresh,
        success,
        noMore);
    return GrassHeaderWidget(
      key: key,
      linkNotifier: linkNotifier,
    );
  }
}

class GrassHeaderWidget extends StatefulWidget {
  final LinkHeaderNotifier linkNotifier;

  const GrassHeaderWidget({
    Key key,
    this.linkNotifier,
  }) : super(key: key);

  @override
  SpaceHeaderWidgetState createState() {
    return SpaceHeaderWidgetState();
  }
}

class SpaceHeaderWidgetState extends State<GrassHeaderWidget>
    with FlareController {
  RefreshMode get _refreshState => widget.linkNotifier.refreshState;
  double get _pulledExtent => widget.linkNotifier.pulledExtent;
  double get _indicatorExtent => widget.linkNotifier.refreshIndicatorExtent;

  ActorAnimation _loadingAnimation;
  ActorAnimation _successAnimation;
  ActorAnimation _pullAnimation;
  double _successTime = 0.0;
  double _loadingTime = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    double animationPosition = _pulledExtent / _indicatorExtent;
    animationPosition *= animationPosition;
    if (_refreshState == RefreshMode.drag) {
      _pullAnimation.apply(
          _pullAnimation.duration * animationPosition, artboard, 1.0);
    } else if (_refreshState == RefreshMode.armed ||
        _refreshState == RefreshMode.inactive) {
      _loadingTime = 0;
      _successTime = 0;
    } else if (_refreshState == RefreshMode.refresh) {
      _loadingAnimation.apply(
          _loadingTime > _loadingAnimation.duration
              ? _loadingTime % _loadingAnimation.duration
              : _loadingTime,
          artboard,
          1.0);
      _loadingTime += elapsed;
    } else if (_refreshState == RefreshMode.refreshed) {
      _successAnimation.apply(_successTime, artboard, 1.0);
      _successTime += elapsed;
    }
    return true;
  }

  void initialize(FlutterActorArtboard actor) {
    _pullAnimation = actor.getAnimation("pulling");
    _successAnimation = actor.getAnimation("finish");
    _loadingAnimation = actor.getAnimation("loading");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _pulledExtent,
      child: Container(
        height: 40,
        child: FlareActor("assets/flare/refresh.flr",
            alignment: Alignment.center,
            animation: "idle",
            fit: BoxFit.none,
            controller: this),
      ),
    );
  }
}
