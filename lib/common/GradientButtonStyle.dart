import 'package:flutter/material.dart';

class GradientButtonStyle {
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  final double? elevation;
  final Color? shadowColor;

  const GradientButtonStyle({
    this.padding,
    this.shape,
    this.textStyle,
    this.elevation,
    this.shadowColor,
  });
}

class GradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Gradient gradient;
  final GradientButtonStyle? style;

  const GradientButton({
    required this.child,
    required this.onPressed,
    required this.gradient,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final shape = style?.shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    final padding = style?.padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    final elevation = style?.elevation ?? 2.0;
    final shadowColor = style?.shadowColor ?? Colors.black26;

    return Material(
      elevation: elevation,
      shape: shape,
      shadowColor: shadowColor,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          shape: shape is CircleBorder ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: shape is RoundedRectangleBorder ? shape.borderRadius as BorderRadius? : null,
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: shape,
          child: Padding(
            padding: padding,
            child: DefaultTextStyle(
              style: style?.textStyle ?? TextStyle(color: Colors.white),
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}