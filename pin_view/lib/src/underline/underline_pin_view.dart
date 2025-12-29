import 'package:flutter/material.dart';
import 'package:pin_view/src/pin_controller.dart';
import 'pin_underline_box.dart';
import '../../core/utils/app_constants.dart';

class UnderlinePinView extends StatefulWidget {
  final int length;
  final bool obscure;
  final ValueChanged<String> onCompleted;

  final TextStyle? textStyle;
  final Color? underlineColor;
  final Color? focusedUnderlineColor;
  final double? boxSize;
  final double? spacing;

  const UnderlinePinView({
    super.key,
    this.length = AppConstants.defaultPinLength,
    this.obscure = false,
    required this.onCompleted,
    this.textStyle,
    this.underlineColor,
    this.focusedUnderlineColor,
    this.boxSize,
    this.spacing,
  });

  @override
  State<UnderlinePinView> createState() => _UnderlinePinViewState();
}

class _UnderlinePinViewState extends State<UnderlinePinView> {
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
          child: PinUnderlineBox(
            controller: pinController.controllers[index],
            focusNode: focusNodes[index],
            nextFocus:
            index < widget.length - 1 ? focusNodes[index + 1] : null,
            previousFocus:
            index > 0 ? focusNodes[index - 1] : null,
            obscure: widget.obscure,
            textStyle: widget.textStyle,
            underlineColor: widget.underlineColor,
            focusedUnderlineColor:
            widget.focusedUnderlineColor,
            boxSize: widget.boxSize,
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
