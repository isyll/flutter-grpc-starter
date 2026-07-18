import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_starter/app/app_lifecycle_handler.dart';
import 'package:flutter_grpc_starter/app/router/app_router.dart';
import 'package:flutter_grpc_starter/app/theme/app_theme.dart';
import 'package:flutter_grpc_starter/core/di/injector.dart';
import 'package:flutter_grpc_starter/core/extensions/context_extensions.dart';
import 'package:flutter_grpc_starter/core/l10n/app_localizations.dart';
import 'package:flutter_grpc_starter/features/app_update/presentation/cubit/app_update_cubit.dart';
import 'package:flutter_grpc_starter/features/app_update/presentation/widgets/app_update_gate.dart';
import 'package:flutter_grpc_starter/features/auth/presentation/bloc/session_bloc.dart';
import 'package:flutter_grpc_starter/features/security/presentation/cubit/app_lock_cubit.dart';
import 'package:flutter_grpc_starter/features/security/presentation/widgets/app_lock_gate.dart';
import 'package:flutter_grpc_starter/features/settings/presentation/cubit/locale_cubit.dart';
import 'package:flutter_grpc_starter/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter_grpc_starter/shared/widgets/feedback/app_snackbar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<SessionBloc>.value(value: sl()),
      BlocProvider<ThemeCubit>.value(value: sl()),
      BlocProvider<LocaleCubit>.value(value: sl()),
      BlocProvider<AppLockCubit>.value(value: sl()),
      BlocProvider<AppUpdateCubit>.value(value: sl()),
    ],
    child: const AppView(),
  );
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LocaleCubit>().state;

    return MaterialApp.router(
      routerConfig: sl<AppRouter>().router,
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return BlocListener<SessionBloc, SessionState>(
          listenWhen: (previous, current) =>
              current.expired && !previous.expired,
          listener: (context, state) => showAppSnackBar(
            context,
            context.l10n.sessionExpiredMessage,
            kind: .error,
          ),
          child: AppLifecycleHandler(
            child: AppLockGate(
              child: AppUpdateGate(
                child: MediaQuery.withClampedTextScaling(
                  maxScaleFactor: 2,
                  child: child ?? const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
