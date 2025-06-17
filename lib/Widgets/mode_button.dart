import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  final String msg;
  final bool isSelected;
  const ModeButton({super.key, required this.msg, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isSelected
              ? [Color.fromRGBO(169, 8, 8, 1), Color.fromRGBO(169, 8, 8, 0)]
              : [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 255, 255, 0),
                ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.all(2), // thickness of the border
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(13, 13, 13, 1),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Center(
          child: Text(
            msg,
            style: TextStyle(
              color: isSelected ? Color.fromRGBO(169, 8, 8, 1) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
