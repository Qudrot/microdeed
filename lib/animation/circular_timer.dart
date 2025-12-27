import 'dart:math';

import 'package:flutter/material.dart';
import 'package:microdeed/design_system/spacers.dart';
import '../design_system/colors.dart';
import '../design_system/styles.dart';


class CircularTimer extends StatefulWidget {
  const CircularTimer({super.key, required this.duration});
  final Duration duration;

  @override
  State<CircularTimer> createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String get timeRemaining {
    final remaining = widget.duration * (1 - _animationController.value);

    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds % 60;

    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).height * 0.3;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Custom circular progress ring
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return CustomPaint(
                painter: CircleTimerPainter(
                  progress: 1 - _animationController.value,
                  strokeWidth: Spacers.sm,
                ),
                size: Size(size, size),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Text(timeRemaining, style: Styles.timerDisplay);
                },
              ),
              Text(
                "remaining",
                style: Styles.captionMedium.copyWith(
                  color: DSColors.secondaryText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircleTimerPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  CircleTimerPainter({required this.progress, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth;

    // Background circle (use design system muted color)
    final backgroundPaint = Paint()
      ..color = DSColors.inactive
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc (use design system CTA color)
    final progressPaint = Paint()
      ..color = DSColors.tealMain
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // progress is 0.0-1.0; convert to radians using 2*pi
    final sweepAngle = progress * 2 * pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircleTimerPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
