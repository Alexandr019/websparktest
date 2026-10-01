import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:websparktest/core/router/app_router.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';
import 'package:websparktest/features/shortest_path/presentation/widgets/path_result_tile.dart';

class ResultListScreen extends StatelessWidget {
  const ResultListScreen({required this.results, super.key});

  final List<PathResultEntity> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result list screen'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: context.pop),
      ),
      body: ResultListView(results: results),
    );
  }
}

class ResultListView extends StatelessWidget {
  const ResultListView({required this.results, super.key});

  final List<PathResultEntity> results;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final result = results[index];
        return PathResultTile(pathString: result.pathString, onTap: () => PreviewRoute(result).push<void>(context));
      },
    );
  }
}
