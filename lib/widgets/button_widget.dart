import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button<T> extends StatelessWidget {
  final T? shape;
  final Color? fillColor;
  final Color borderTint;
  final double borderSize;
  final double radius;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final String? label;
  final double contentSpacing;
  final double? minFontSize;
  final double? fontSize;
  final int? maxLines;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Axis direction;
  final bool disable;
  final bool loading;
  final WrapAlignment horizontalAlignment;
  final WrapAlignment verticalAlignment;
  final WrapCrossAlignment wrapCrossAlignment;
  final Function()? onPressed;

  const Button({
    super.key,
    this.shape,
    this.label,
    this.fillColor,
    this.borderTint = Colors.transparent,
    this.radius = 8,
    this.width,
    this.height,
    this.labelStyle,
    this.fontColor,
    this.fontSize,
    this.leading,
    this.trailing,
    this.fontWeight,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.padding = const EdgeInsets.fromLTRB(20, 18, 20, 18),
    this.contentSpacing = 18,
    this.minFontSize,
    this.maxLines,
    this.borderSize = 0,
    this.direction = Axis.horizontal,
    this.disable = false,
    this.loading = false,
    this.horizontalAlignment = WrapAlignment.center,
    this.verticalAlignment = WrapAlignment.center,
    this.wrapCrossAlignment = WrapCrossAlignment.center,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle =
        (this.labelStyle ?? Theme.of(context).textTheme.titleMedium)!.copyWith(
      color: disable
          ? Colors.white
          : fontColor ?? this.labelStyle?.color ?? Colors.white,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
    );

    Color? fillColor = disable
        ? Theme.of(context).disabledColor
        : this.fillColor ?? Theme.of(context).primaryColor;

    return Padding(
      padding: margin,
      child: InkWell(
        onTap: () {
          if (!(disable || loading)) onPressed?.call();
        },
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: shape == null
              ? ShapeDecoration(
                  shape: StadiumBorder(
                    side: borderSize > 0
                        ? BorderSide(color: borderTint, width: borderSize)
                        : BorderSide.none,
                  ),
                  color: fillColor,
                )
              : shape is BoxShape
                  ? BoxDecoration(
                      shape: shape as BoxShape,
                      borderRadius: shape == BoxShape.circle
                          ? null
                          : BorderRadius.circular(radius),
                      border: Border.all(
                        color: borderTint,
                        width: borderSize,
                      ),
                      color: fillColor,
                    )
                  : ShapeDecoration(
                      shape: shape as ShapeBorder,
                      color: fillColor,
                    ),
          child: Wrap(
            direction: direction,
            spacing: contentSpacing,
            runSpacing: contentSpacing,
            alignment: horizontalAlignment,
            runAlignment: verticalAlignment,
            crossAxisAlignment: wrapCrossAlignment,
            children: loading
                ? [
                    SizedBox(
                      width: labelStyle.fontSize! * 2,
                      child: CupertinoActivityIndicator(
                        color: labelStyle.color,
                      ),
                    )
                  ]
                : [
                    if (leading != null) leading!,
                    if (label != null)
                      Text(
                        label!,
                        textAlign: TextAlign.center,
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: labelStyle,
                      ),
                    if (trailing != null) trailing!,
                  ],
          ),
        ),
      ),
    );
  }
}
