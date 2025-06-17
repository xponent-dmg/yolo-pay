import 'package:flutter/material.dart';

class CustomNavbarItem extends StatelessWidget {
  final String img;
  final bool isSelected;
  final String label;
  const CustomNavbarItem({
    super.key,
    required this.img,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  isSelected
                      ? Color.fromRGBO(255, 255, 255, 1)
                      : Color.fromRGBO(76, 76, 76, 1),
                  Color.fromRGBO(13, 13, 13, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(
              isSelected ? 2 : 1,
            ), // thickness of the border
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(13, 13, 13, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.all(15),
              child: Center(
                child: SizedBox(
                  width: isSelected ? 35 : 24,
                  height: isSelected ? 35 : 24,
                  child: isSelected
                      ? Icon(Icons.qr_code_scanner, color: Colors.white)
                      : Image.asset(
                          img,
                          fit: BoxFit.contain,
                          color: !isSelected
                              ? Color.fromRGBO(255, 255, 255, 0.3)
                              : Colors.white,
                        ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: !isSelected
                ? Color.fromRGBO(255, 255, 255, 0.3)
                : Colors.white,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
