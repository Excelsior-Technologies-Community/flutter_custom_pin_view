import 'package:flutter/material.dart';
import 'package:pin_view/src/pin_controller.dart';
import 'pin_box.dart';
import '../../core/utils/app_constants.dart';

class PinView extends StatefulWidget {
  final int length;
  final bool obscure;
  final ValueChanged<String> onCompleted;

  // 🎨 Style
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? boxSize;
  final double? borderRadius;
  final double? spacing;

  const PinView({
    super.key,
    this.length = AppConstants.defaultPinLength,
    this.obscure = false,
    required this.onCompleted,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.boxSize,
    this.borderRadius,
    this.spacing,
  });

  @override
  State<PinView> createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  late PinController pinController;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    pinController = PinController(widget.length);
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    final space = widget.spacing ?? AppConstants.pinBoxSpacing;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: space / 2),
          child: PinBox(
            controller: pinController.controllers[index],
            focusNode: focusNodes[index],
            nextFocus:
            index < widget.length - 1 ? focusNodes[index + 1] : null,
            previousFocus:
            index > 0 ? focusNodes[index - 1] : null,
            obscure: widget.obscure,
            textStyle: widget.textStyle,
            fillColor: widget.fillColor,
            borderColor: widget.borderColor,
            focusedBorderColor: widget.focusedBorderColor,
            boxSize: widget.boxSize,
            borderRadius: widget.borderRadius,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
