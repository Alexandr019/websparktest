import 'package:flutter/material.dart';
import 'package:websparktest/core/constants/app_colors.dart';
import 'package:websparktest/features/shortest_path/domain/entities/cell_type.dart';

class PathGridPainter extends CustomPainter {
  const PathGridPainter({required this.cells, required this.cellSize});

  final List<List<CellType>> cells;
  final double cellSize;

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint();
    final border = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.black;
    final fontSize = (cellSize / 4.5).clamp(7.0, 12.0);

    for (var y = 0; y < cells.length; y++) {
      for (var x = 0; x < cells[y].length; x++) {
        final type = cells[y][x];
        final rect = Rect.fromLTWH(x * cellSize, y * cellSize, cellSize, cellSize);
        canvas
          ..drawRect(rect, fill..color = _fillColor(type))
          ..drawRect(rect, border);
        _paintLabel(canvas, rect, '($x,$y)', type, fontSize);
      }
    }
  }

  void _paintLabel(Canvas canvas, Rect rect, String label, CellType type, double fontSize) {
    final painter = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(fontSize: fontSize, color: type == CellType.blocked ? AppColors.white : AppColors.black),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    painter
      ..paint(canvas, rect.center - Offset(painter.width / 2, painter.height / 2))
      ..dispose();
  }

  Color _fillColor(CellType type) => switch (type) {
    CellType.empty => AppColors.white,
    CellType.blocked => AppColors.black,
    CellType.start => AppColors.tealAccent,
    CellType.end => AppColors.teal,
    CellType.path => AppColors.green,
  };

  @override
  bool shouldRepaint(PathGridPainter oldDelegate) => oldDelegate.cells != cells || oldDelegate.cellSize != cellSize;
}
