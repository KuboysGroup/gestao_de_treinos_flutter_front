// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ButtonsAttributes {
  static BorderRadius ButtonRadius = BorderRadius.circular(50.0);
  static Border ButtonBorder = Border.all(
    color: Colors.black12,
    width: 0.5,
  );
  static InteractiveInkFeatureFactory ButtonInkRipple = InkRipple.splashFactory;
  static Color ButtonColor = Colors.white;
  static double kIconButtonSize = 44.0;
  static EdgeInsets kIconButtonPadding = const EdgeInsets.all(10.0);
  static double kDisabledButtonOpacity = 0.75;

  static EdgeInsets kSegmentedButtonTextPadding =
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  static BorderSide kSegmentedButtonBorder = const BorderSide(
    color: Colors.black12,
    width: 0.5,
  );
  static Color kSegmentedSelectedButtonTextColor = Colors.white;
  static Color kSegmentedUnselectedButtonTextColor = Colors.black;
  static Color kSegmentedButtonCheckmarkColor = Colors.white;
  static EdgeInsets kSegmentedButtonPadding = const EdgeInsets.all(4.0);
  static double kSegmentedButtonHeight = 70.0;
}

enum ButtonType { elevated, filled, outlined, tonal, text }

class Button extends StatefulWidget {
  final VoidCallback onTap;
  final ButtonType type;
  final Color color;
  final String? title;
  final Widget? icon;
  final bool active;
  final double height;
  final bool? fit;
  final double? width;

  const Button({
    required this.onTap,
    required this.type,
    required this.color,
    this.title,
    this.icon,
    this.active = true,
    this.height = 50.0,
    this.fit,
    this.width,
    super.key,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      lowerBound: 0.0,
      upperBound: 0.015,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Transform.scale(
      scale: _scale,
      child: Container(
        height: widget.height,
        decoration: _getBoxDecoration(widget.type, widget.color),
        child: InkWell(
          splashFactory: InkSparkle.splashFactory,
          borderRadius: ButtonsAttributes.ButtonRadius,
          onTap: () {
            widget.onTap();
            _controller.forward().then((value) => _controller.reverse());
          },
          onTapDown: (TapDownDetails details) {
            _controller.forward();
          },
          onTapCancel: () {
            _controller.reverse();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null)
                    Padding(
                      padding: ButtonsAttributes.kIconButtonPadding,
                      child: widget.icon,
                    ),
                  Text(
                    widget.title!,
                    style: _getTextStyle(widget.type, widget.color),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static TextStyle _getTextStyle(ButtonType type, Color color) {
    switch (type) {
      case ButtonType.elevated:
        return const TextStyle(
          color: Colors.white,
        );
      case ButtonType.filled:
        return const TextStyle(
          color: Colors.white,
        );
      case ButtonType.outlined:
        return TextStyle(
          color: color,
        );
      case ButtonType.tonal:
        return const TextStyle(
          color: Colors.white,
        );
      case ButtonType.text:
        return TextStyle(
          color: color,
        );
    }
  }

  static BoxDecoration _getBoxDecoration(ButtonType type, Color color) {
    switch (type) {
      case ButtonType.elevated:
        return BoxDecoration(
          borderRadius: ButtonsAttributes.ButtonRadius,
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.0,
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        );
      case ButtonType.filled:
        return BoxDecoration(
          borderRadius: ButtonsAttributes.ButtonRadius,
          color: color,
        );
      case ButtonType.outlined:
        return BoxDecoration(
            borderRadius: ButtonsAttributes.ButtonRadius,
            color: Colors.transparent,
            border: Border.all(
              width: 0.5,
              color: color,
            ));
      case ButtonType.tonal:
        return BoxDecoration(
          borderRadius: ButtonsAttributes.ButtonRadius,
          color: color.withOpacity(0.5),
        );
      case ButtonType.text:
        return BoxDecoration(
          borderRadius: ButtonsAttributes.ButtonRadius,
          color: Colors.transparent,
        );
    }
  }
}
