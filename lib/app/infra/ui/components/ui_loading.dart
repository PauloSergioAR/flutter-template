import 'dart:math';

import 'package:flutter/material.dart';

import '../../infra.dart';

bool _isShowing = false;

class UiLoading {
  static void show(
    BuildContext context, {
    required bool show,
  }) {
    if (show) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.white60,
        builder: (context) {
          _isShowing = true;
          return const IsaCustomLoading();
        },
      );
    } else {
      if (_isShowing) {
        Navigator.pop(context);
        _isShowing = false;
      }
    }
  }

  static Widget showLoadingWidget() => const IsaCustomLoading();
}

class IsaCustomLoading extends StatefulWidget {
  const IsaCustomLoading({super.key});

  @override
  State<IsaCustomLoading> createState() => IsaCustomLoadingState();
}

class IsaCustomLoadingState extends State<IsaCustomLoading>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double get _strokeWidth => 6.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        child: CustomPaint(
          size: const Size.square(120),
          painter: _GradientCircularProgressPainter(
            radius: 180,
            strokeWidth: _strokeWidth,
            gradientColors: [
              UiColors.primary.withOpacity(0),
              UiColors.primary,
            ],
          ),
        ),
        builder: (_, child) {
          return Transform.rotate(
            angle: _animationController.value * 2 * pi,
            child: child,
          );
        },
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({
    required this.radius,
    required this.strokeWidth,
    required this.gradientColors,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(
          size.width - strokeWidth,
          size.height - strokeWidth,
        );
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = SweepGradient(
        colors: gradientColors,
        startAngle: 0.0,
        endAngle: 1.5 * pi,
      ).createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(_GradientCircularProgressPainter oldDelegate) {
    return strokeWidth != oldDelegate.strokeWidth ||
        gradientColors != oldDelegate.gradientColors;
  }
}
