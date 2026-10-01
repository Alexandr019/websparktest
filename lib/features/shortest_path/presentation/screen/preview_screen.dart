import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';
import 'package:websparktest/features/shortest_path/presentation/widgets/path_grid.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({required this.result, super.key});

  final PathResultEntity result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview screen'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: context.pop),
      ),
      body: PreviewView(result: result),
    );
  }
}

class PreviewView extends StatelessWidget {
  const PreviewView({required this.result, super.key});

  final PathResultEntity result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: PathGrid(cells: result.buildCells())),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(result.pathString, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
