import 'package:flutter/material.dart';
import 'package:flutter_grpc_starter/app/theme/app_colors.dart';
import 'package:flutter_grpc_starter/core/l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => theme.colorScheme;

  bool get isDarkMode => theme.brightness == .dark;

  AppLocalizations get l10n => .of(this);

  Size get screenSize => MediaQuery.sizeOf(this);

  AppSemanticColors get semanticColors =>
      theme.extension<AppSemanticColors>() ?? .light;

  TextTheme get textTheme => theme.textTheme;

  ThemeData get theme => Theme.of(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
}
