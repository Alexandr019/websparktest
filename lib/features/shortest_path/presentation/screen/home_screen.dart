import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websparktest/core/constants/app_colors.dart';
import 'package:websparktest/core/di/dependencies.dart';
import 'package:websparktest/core/router/app_router.dart';
import 'package:websparktest/features/shortest_path/presentation/cubit/home_cubit.dart';
import 'package:websparktest/features/shortest_path/presentation/cubit/home_state.dart';
import 'package:websparktest/features/shortest_path/presentation/widgets/custom_buttons.dart';
import 'package:websparktest/features/shortest_path/presentation/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home screen')),
        body: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late final TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) =>
            current is SuccessHomeState && (previous is! SuccessHomeState || previous.requestId != current.requestId),
        listener: (context, state) {
          if (state case SuccessHomeState(:final url)) {
            ProcessRoute(baseUrl: url.trim()).push(context);
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Set valid API base URL in order to continue'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.compare_arrows, color: AppColors.gray),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              controller: _urlController,
                              error: state is FailureHomeState ? state.error : null,
                              onChanged: context.read<HomeCubit>().onUrlChanged,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomButton(title: 'Start counting process', onPressed: context.read<HomeCubit>().onSubmitted),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
