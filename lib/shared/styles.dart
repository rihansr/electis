import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/colors.dart';
import '../services/navigation_service.dart';
import '/shared/strings.dart';
import 'enums.dart';

final style = Style.value;

class Style {
  static Style get value => Style._();
  Style._();

  SnackBar snackbar(
    String message, {
    AlertType? type,
    String? actionLabel,
    int duration = 3,
    Function()? onAction,
  }) =>
      SnackBar(
        backgroundColor: type?.backgroundColor,
        content: Text(
          message,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(navigator.context)
              .snackBarTheme
              .contentTextStyle!
              .copyWith(
                color: type?.textColor,
              ),
        ),
        action: (onAction != null)
            ? SnackBarAction(
                label: actionLabel ?? type?.actionLabel ?? string.okay,
                textColor: type?.textColor,
                onPressed: onAction,
              )
            : null,
        duration: Duration(seconds: duration),
      );

  final defaultBlur = ImageFilter.blur(sigmaX: 4, sigmaY: 4);

  final numFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    FilteringTextInputFormatter.deny(RegExp(r'^0+')),
  ];

  List<BoxShadow> defaultShadow() => [
        BoxShadow(
          color: Theme.of(navigator.context).colorScheme.shadow,
          blurRadius: 8,
          offset: const Offset(-2, 2),
        ),
      ];

  InputBorder inputBorder(Color color, [underlineOnly = false]) => underlineOnly
      ? UnderlineInputBorder(borderSide: BorderSide(color: color, width: .25))
      : OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: color,
            width: 0.75,
          ),
        );

  Widget get dismissableDeleteIcon => Container(
        decoration:
            BoxDecoration(color: Theme.of(navigator.context).colorScheme.error),
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.centerRight,
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: const Icon(
          CupertinoIcons.delete,
          size: 20,
          color: Colors.white,
        ),
      );

  Decoration gradientBackground({
    required List<Color> colors,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
    double radius = 9,
    BorderRadiusGeometry? borderRadius,
  }) =>
      ShapeDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
        ),
      );
}

extension _MessageTypeExtensions on AlertType {
  String get actionLabel {
    switch (this) {
      case AlertType.error:
        return string.retry;
      default:
        return string.okay;
    }
  }

  Color? get backgroundColor => (() {
        final theme = Theme.of(navigator.context);
        switch (this) {
          case AlertType.success:
            return theme.colorScheme.primary;
          case AlertType.error:
            return theme.colorScheme.error;
          case AlertType.info:
          default:
            return theme.colorScheme.outline;
        }
      }());

  Color? get textColor => (() {
        switch (this) {
          default:
            return ColorPalette.dark().headline;
        }
      }());
}
