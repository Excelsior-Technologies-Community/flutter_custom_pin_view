import 'package:flutter/material.dart';
import 'package:fluttter_custom_pin_view/core/theme/app_colors.dart';
import 'package:fluttter_custom_pin_view/widgets/pin_view/circle_pin_view.dart';
import 'package:fluttter_custom_pin_view/widgets/pin_view/underline_pin_view.dart';
import '../../widgets/pin_view/pin_view.dart';

class PinDemoScreen extends StatelessWidget {
  const PinDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(title: const Text(
          'PinView Demo', style: TextStyle(fontWeight: FontWeight.bold)),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  const Text(
                    'Enter your PIN',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  PinView(
                    spacing: 10,
                    boxSize: 50,
                    textStyle: TextStyle(color: Colors.red),
                    borderColor: Colors.pink,
                    fillColor: Colors.yellow,
                    focusedBorderColor: Colors.green,
                    length: 4,
                    obscure: true,
                    onCompleted: (pin) {
                      debugPrint('PIN Entered: $pin');
                    },
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  const Text(
                    'Enter your PIN',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: UnderlinePinView(
                      spacing: 10,
                      underlineColor: Colors.black,
                      focusedUnderlineColor: Colors.red,
                      length: 5,
                      obscure: false,
                      onCompleted: (pin) {
                        debugPrint('Entered PIN: $pin');
                      },
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  const Text(
                    'Enter your PIN',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  CirclePinView(
                    length: 4,
                    boxSize: 50,
                    obscure: true,
                    spacing: 10,
                    textStyle: const TextStyle(
                        fontSize: 22, color: Colors.deepPurple),
                    fillColor: Colors.grey.shade100,
                    borderColor: Colors.grey,
                    focusedBorderColor: Colors.deepPurple,
                    onCompleted: (pin) {},
                  ),


                  SizedBox(height: 20),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
