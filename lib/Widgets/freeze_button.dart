import 'package:flutter/material.dart';

class FreezeButton extends StatelessWidget {
  final String img;
  final bool isSelected;
  final VoidCallback onToggle;
  const FreezeButton({
    super.key,
    required this.img,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isSelected
                    ? [
                        Color.fromRGBO(169, 8, 8, 1),
                        Color.fromRGBO(169, 8, 8, 0),
                      ]
                    : [
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(255, 255, 255, 0),
                      ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(2), // thickness of the border
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(13, 13, 13, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.all(15),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    img,
                    fit: BoxFit.contain,
                    color: isSelected
                        ? Color.fromRGBO(169, 8, 8, 1)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          isSelected ? "unfreeze" : 'freeze',
          style: TextStyle(
            color: isSelected ? Color.fromRGBO(169, 8, 8, 1) : Colors.white,
          ),
        ),
      ],
    );
  }
}
