import 'package:flutter/material.dart';
import 'package:yolo_intern/Widgets/debit_card.dart';
import 'package:yolo_intern/Widgets/custom_bottom_navbar.dart';
import 'package:yolo_intern/Widgets/mode_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(13, 13, 13, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 328,
                    height: 36,
                    margin: EdgeInsets.only(top: 64, left: 16),
                    child: Text(
                      'select payment mode',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: -0.17,
                      ),
                    ),
                  ),
                  Container(
                    width: 328,
                    height: 42,
                    margin: EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      'choose your preferred payment method to make payment.',
                      style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: -0.17,
                      ),
                    ),
                  ),
                  Container(
                    width: 328,
                    height: 46,
                    margin: EdgeInsets.only(top: 24, left: 16),
                    child: Row(
                      spacing: 8,
                      children: [
                        ModeButton(msg: 'Pay'),
                        ModeButton(msg: "Card", isSelected: true),
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 18,
                    margin: EdgeInsets.only(left: 16, top: 48),
                    child: Text(
                      "YOUR DIGITAL DEBIT CARD",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  DebitCard(),
                ],
              ),
            ),
            CustomBottomNavBar(selectedIndex: 1),
          ],
        ),
      ),
    );
  }
}
