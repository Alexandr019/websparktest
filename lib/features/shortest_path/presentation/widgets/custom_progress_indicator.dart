import 'package:flutter/material.dart';
import 'package:websparktest/core/constants/app_colors.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    required this.progress,
    this.isLoading = false,
    this.isFailure = false,
    this.onCompleted,
    super.key,
  });

  final double progress;
  final bool isLoading;
  final bool isFailure;
  final VoidCallback? onCompleted;

  @override
  State<CustomProgressIndicator> createState() => _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4))
      ..addStatusListener(_handleAnimationStatus);
    _animation = const AlwaysStoppedAnimation(0);
    _updateAnimation();
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed && !widget.isLoading && widget.progress >= 1) {
      widget.onCompleted?.call();
    }
  }

  @override
  void didUpdateWidget(covariant CustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress ||
        oldWidget.isLoading != widget.isLoading ||
        oldWidget.isFailure != widget.isFailure) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    final current = _animation.value;
    final target = widget.isFailure
        ? 1.0
        : widget.isLoading
        ? 0.9
        : widget.progress.clamp(current, 1.0);

    if (target <= current) return;

    _animation = Tween<double>(
      begin: current,
      end: target,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller
      ..duration = Duration(
        milliseconds: widget.isLoading
            ? 30000
            : widget.isFailure
            ? 350
            : 800,
      )
      ..forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final value = _animation.value;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${(value * 100).round()}%', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 6,
                color: AppColors.primary,
                backgroundColor: AppColors.gray.withValues(alpha: 0.2),
              ),
            ),
          ],
        );
      },
    );
  }
}
