import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import 'colors.dart';
import 'enums.dart';
import 'strings.dart';

final style = Style.value;

class Style {
  static Style get value => Style._();
  Style._();

  SnackBar snackbar(
    String message, {
    MessageType? type,
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

  ImageFilter defaultBlur = ImageFilter.blur(sigmaX: 4, sigmaY: 4);
}

extension _MessageTypeExtensions on MessageType {
  String get actionLabel {
    switch (this) {
      case MessageType.error:
        return string.retry;
      default:
        return string.okay;
    }
  }

  Color? get backgroundColor => (() {
        switch (this) {
          case MessageType.success:
            return ColorPalette.current().active;
          case MessageType.error:
            return ColorPalette.current().error;
          case MessageType.info:
          default:
            return ColorPalette.current().primary;
        }
      }());

  Color? get textColor => (() {
        switch (this) {
          default:
            return ColorPalette.dark().headline;
        }
      }());
}