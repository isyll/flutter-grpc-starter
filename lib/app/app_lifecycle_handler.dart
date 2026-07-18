import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_starter/core/di/injector.dart';
import 'package:flutter_grpc_starter/features/app_update/presentation/cubit/app_update_cubit.dart';
import 'package:flutter_grpc_starter/services/review/app_review_service.dart';

class AppLifecycleHandler extends StatefulWidget {
  const AppLifecycleHandler({required this.child, super.key});

  final Widget child;

  @override
  State<AppLifecycleHandler> createState() => _AppLifecycleHandlerState();
}

class _AppLifecycleHandlerState extends State<AppLifecycleHandler> {
  late final _lifecycleListener = AppLifecycleListener(
    onShow: _onShow,
    onResume: _onResume,
  );

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    unawaited(context.read<AppUpdateCubit>().check());
    unawaited(sl<AppReviewService>().recordSession());
  }

  void _onResume() => unawaited(context.read<AppUpdateCubit>().check());

  void _onShow() {
    final review = sl<AppReviewService>();
    unawaited(
      review.recordSession().then((_) => review.maybeRequestReview()),
    );
  }
}
