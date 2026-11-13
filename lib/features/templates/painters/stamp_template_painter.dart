import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/stamp_template.dart';

class StampTemplatePainter extends CustomPainter {
  final StampTemplate template;
  final Color fillColor;
  final Color borderColor;
  final Color cutoutColor;
  final double borderWidth;

  const StampTemplatePainter({
    required this.template,
    required this.fillColor,
    required this.borderColor,
    this.cutoutColor = Colors.white,
    this.borderWidth = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = _buildPath(size, template.shape);

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..isAntiAlias = true;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);

    if (template.shape == StampShape.filmFrame) {
      _drawFilmPerforations(canvas, size);
    }
  }

  Path _buildPath(Size size, StampShape shape) {
    switch (shape) {
      case StampShape.square:
        return Path()..addRect(Offset.zero & size);

      case StampShape.rectangle:
        return Path()..addRect(Offset.zero & size);

      case StampShape.circle:
        return Path()..addOval(
          Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: math.min(size.width, size.height),
            height: math.min(size.width, size.height),
          ),
        );

      case StampShape.oval:
        return Path()..addOval(Offset.zero & size);

      case StampShape.postage:
      case StampShape.scalloped:
        return _scallopedPath(size);

      case StampShape.heart:
        return _heartPath(size);

      case StampShape.flower:
        return _flowerPath(size);

      case StampShape.cloud:
        return _cloudPath(size);

      case StampShape.arch:
        return _archPath(size);

      case StampShape.ticket:
        return _ticketPath(size);

      case StampShape.filmFrame:
        return _filmFramePath(size);

      case StampShape.roundedRectangle:
        return Path()..addRRect(
          RRect.fromRectAndRadius(
            Offset.zero & size,
            Radius.circular(size.shortestSide * 0.14),
          ),
        );
    }
  }

  Path _heartPath(Size size) {
    final width = size.width;
    final height = size.height;

    return Path()
      ..moveTo(width * 0.5, height * 0.92)
      ..cubicTo(
        width * 0.35,
        height * 0.78,
        width * 0.05,
        height * 0.55,
        width * 0.05,
        height * 0.30,
      )
      ..cubicTo(
        width * 0.05,
        height * 0.02,
        width * 0.38,
        height * 0.00,
        width * 0.5,
        height * 0.23,
      )
      ..cubicTo(
        width * 0.62,
        height * 0.00,
        width * 0.95,
        height * 0.02,
        width * 0.95,
        height * 0.30,
      )
      ..cubicTo(
        width * 0.95,
        height * 0.55,
        width * 0.65,
        height * 0.78,
        width * 0.5,
        height * 0.92,
      )
      ..close();
  }

  Path _flowerPath(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * 0.46;

    final path = Path();

    const points = 120;
    const petals = 8;

    for (var i = 0; i <= points; i++) {
      final angle = (i / points) * math.pi * 2;
      final distance = radius * (0.72 + 0.28 * math.cos(petals * angle));

      final point = Offset(
        center.dx + distance * math.cos(angle),
        center.dy + distance * math.sin(angle),
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    return path..close();
  }

  Path _cloudPath(Size size) {
    final width = size.width;
    final height = size.height;

    return Path()
      ..moveTo(width * 0.16, height * 0.72)
      ..cubicTo(
        width * 0.02,
        height * 0.72,
        width * 0.00,
        height * 0.48,
        width * 0.16,
        height * 0.43,
      )
      ..cubicTo(
        width * 0.17,
        height * 0.17,
        width * 0.43,
        height * 0.10,
        width * 0.55,
        height * 0.32,
      )
      ..cubicTo(
        width * 0.75,
        height * 0.12,
        width * 0.98,
        height * 0.30,
        width * 0.88,
        height * 0.50,
      )
      ..cubicTo(
        width * 1.08,
        height * 0.67,
        width * 0.88,
        height * 0.83,
        width * 0.73,
        height * 0.79,
      )
      ..cubicTo(
        width * 0.55,
        height * 0.98,
        width * 0.29,
        height * 0.93,
        width * 0.25,
        height * 0.77,
      )
      ..cubicTo(
        width * 0.21,
        height * 0.77,
        width * 0.18,
        height * 0.75,
        width * 0.16,
        height * 0.72,
      )
      ..close();
  }

  Path _archPath(Size size) {
    final width = size.width;
    final height = size.height;

    return Path()
      ..moveTo(0, height)
      ..lineTo(0, width / 2)
      ..cubicTo(0, height * 0.12, width, height * 0.12, width, width / 2)
      ..lineTo(width, height)
      ..close();
  }

  Path _ticketPath(Size size) {
    final width = size.width;
    final height = size.height;
    final notch = math.min(width, height) * 0.10;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height * 0.38)
      ..arcToPoint(
        Offset(width, height * 0.62),
        radius: Radius.circular(notch),
        clockwise: false,
      )
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..lineTo(0, height * 0.62)
      ..arcToPoint(
        Offset(0, height * 0.38),
        radius: Radius.circular(notch),
        clockwise: false,
      )
      ..close();
  }

  Path _filmFramePath(Size size) {
    return Path()..addRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size,
        Radius.circular(size.shortestSide * 0.06),
      ),
    );
  }

  Path _scallopedPath(Size size) {
    final width = size.width;
    final height = size.height;
    final perimeter = 2 * (width + height);
    final amplitude = math.min(width, height) * 0.035;
    const samplesPerSide = 40;

    final path = Path();

    for (var i = 0; i <= samplesPerSide * 4; i++) {
      final progress = i / (samplesPerSide * 4);
      final distance = progress * perimeter;

      final wave = amplitude * math.sin(progress * math.pi * 2 * 20);

      double x;
      double y;

      if (distance <= width) {
        x = distance;
        y = -wave;
      } else if (distance <= width + height) {
        x = width + wave;
        y = distance - width;
      } else if (distance <= 2 * width + height) {
        x = width - (distance - width - height);
        y = height + wave;
      } else {
        x = -wave;
        y = height - (distance - 2 * width - height);
      }

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    return path..close();
  }

  void _drawFilmPerforations(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = cutoutColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final holeWidth = size.width * 0.075;
    final holeHeight = size.height * 0.055;
    final spacing = size.width * 0.13;

    for (var x = spacing; x < size.width - spacing / 2; x += spacing) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x, size.height * 0.075),
            width: holeWidth,
            height: holeHeight,
          ),
          const Radius.circular(2),
        ),
        paint,
      );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x, size.height * 0.925),
            width: holeWidth,
            height: holeHeight,
          ),
          const Radius.circular(2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant StampTemplatePainter oldDelegate) {
    return oldDelegate.template.id != template.id ||
        oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.cutoutColor != cutoutColor ||
        oldDelegate.borderWidth != borderWidth;
  }
}
