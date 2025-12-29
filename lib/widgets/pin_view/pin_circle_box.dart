import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/app_constants.dart';

class PinCircleBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final FocusNode? previousFocus;
  final bool obscure;

  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? boxSize;

  const PinCircleBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    this.previousFocus,
    this.obscure = false,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.boxSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = boxSize ?? AppConstants.pinBoxSize;

    return SizedBox(
      width: size,
      height: size,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscure,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: textStyle ??
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: fillColor ?? Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.border,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size),
            borderSide: BorderSide(
              color: focusedBorderColor ?? AppColors.focusedBorder,
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
