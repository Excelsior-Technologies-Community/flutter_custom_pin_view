import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/app_constants.dart';

class PinUnderlineBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final FocusNode? previousFocus;
  final bool obscure;

  final TextStyle? textStyle;
  final Color? underlineColor;
  final Color? focusedUnderlineColor;
  final double? boxSize;

  const PinUnderlineBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    this.previousFocus,
    this.obscure = false,
    this.textStyle,
    this.underlineColor,
    this.focusedUnderlineColor,
    this.boxSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = boxSize ?? AppConstants.pinBoxSize;

    return SizedBox(
      width: size,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscure,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: textStyle ??
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: underlineColor ?? AppColors.border,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color:
              focusedUnderlineColor ?? AppColors.focusedBorder,
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            nextFocus?.requestFocus();
          } else {
            previousFocus?.requestFocus();
          }
        },
      ),
    );
  }
}
