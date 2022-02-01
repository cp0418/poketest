import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/screens/checkout_screen.dart';
import 'package:flutter_exam_pokedex/screens/pos_screen.dart';

class POSHomeScreen extends StatelessWidget {
  const POSHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(flex: 1, child: CheckOutScreen()),
            Container(
              width: 1,
              height: double.infinity,
              color: Colors.grey,
            ),
            Expanded(flex: 2, child: POSScreen()),
          ],
        ),
      ),
    );
  }
}
