import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:websparktest/features/shortest_path/domain/entities/cell_type.dart';
import 'package:websparktest/features/shortest_path/presentation/widgets/path_grid_painter.dart';

class PathGrid extends StatelessWidget {
  const PathGrid({required this.cells, super.key});

  final List<List<CellType>> cells;

  static const _minCellSize = 36.0;

  @override
  Widget build(BuildContext context) {
    final rows = cells.length;
    final columns = rows == 0 ? 0 : cells.first.length;
    if (columns == 0) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final cellSize = math.max(constraints.maxWidth / columns, _minCellSize);
        final gridSize = Size(columns * cellSize, rows * cellSize);

        return SizedBox(
          width: constraints.maxWidth,
          height: math.min(gridSize.height, constraints.maxHeight),
          child: InteractiveViewer(
            constrained: false,
            minScale: 0.2,
            maxScale: 4,
            child: RepaintBoundary(
              child: CustomPaint(
                size: gridSize,
                painter: PathGridPainter(cells: cells, cellSize: cellSize),
              ),
            ),
          ),
        );
      },
    );
  }
}
