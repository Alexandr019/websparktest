import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:websparktest/core/constants/app_colors.dart';
import 'package:websparktest/core/di/dependencies.dart';
import 'package:websparktest/core/router/app_router.dart';
import 'package:websparktest/features/shortest_path/presentation/cubit/process_cubit.dart';
import 'package:websparktest/features/shortest_path/presentation/cubit/process_state.dart';
import 'package:websparktest/features/shortest_path/presentation/widgets/custom_buttons.dart';
import 'package:websparktest/features/shortest_path/presentation/widgets/custom_progress_indicator.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({required this.baseUrl, super.key});

  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProcessCubit>(param1: baseUrl)..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Process screen'),
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: context.pop),
        ),
        body: const ProcessView(),
      ),
    );
  }
}

class ProcessView extends StatefulWidget {
  const ProcessView({super.key});

  @override
  State<ProcessView> createState() => _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {
  bool _isProgressCompleted = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessCubit, ProcessState>(
      listenWhen: (_, state) => state is ProcessSent,
      listener: (context, state) {
        if (state case ProcessSent(:final results)) {
          ResultListRoute(results).push<void>(context);
        }
      },
      builder: (context, state) {
        final errorText = switch (state) {
          ProcessSendFailure(:final message) => message,
          ProcessFailure(:final message) => message,
          _ => null,
        };

        final isFinished = state is ProcessResultsState && _isProgressCompleted;
        final showSendButton = isFinished || state is ProcessSending || state is ProcessSendFailure;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isFinished)
                        const Text(
                          'All calculations has finished, '
                          'you can send your results to server',
                          textAlign: TextAlign.center,
                        ),
                      if (isFinished) const SizedBox(height: 16),
                      if (state is ProcessFailure) ...[
                        Text(errorText!, textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                      ],
                      CustomProgressIndicator(
                        progress: state.progress,
                        isLoading: state is ProcessLoading,
                        isFailure: state is ProcessFailure,
                        onCompleted: () {
                          if (mounted && !_isProgressCompleted) {
                            setState(() => _isProgressCompleted = true);
                          }
                        },
                      ),
                      if (errorText != null && state is ProcessSendFailure) ...[
                        const SizedBox(height: 16),
                        Text(
                          errorText,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.error),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (showSendButton)
                CustomButton(
                  title: 'Send results to server',
                  isLoading: state is ProcessSending,
                  onPressed: state is ProcessSending ? null : context.read<ProcessCubit>().sendResults,
                ),
            ],
          ),
        );
      },
    );
  }
}
