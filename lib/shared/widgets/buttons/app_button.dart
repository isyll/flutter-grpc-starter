import 'package:flutter/material.dart';
import 'package:flutter_grpc_starter/shared/animations/app_motion.dart';
import 'package:flutter_grpc_starter/shared/animations/tap_scale.dart';
import 'package:flutter_grpc_starter/shared/widgets/adaptive/adaptive_progress_indicator.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.expanded = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final button = TapScale(
      enabled: !loading && onPressed != null,
      child: FilledButton(
        onPressed: loading ? null : onPressed,
        child: AnimatedSwitcher(
          duration: AppMotion.mediumDuration,
          switchInCurve: AppMotion.decelerate,
          switchOutCurve: AppMotion.accelerate,
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: loading
              ? AdaptiveProgressIndicator(
                  size: 22,
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              : Text(label, key: const ValueKey('label')),
        ),
      ),
    );

    if (!expanded) return button;
    return SizedBox(width: .infinity, child: button);
  }
}
