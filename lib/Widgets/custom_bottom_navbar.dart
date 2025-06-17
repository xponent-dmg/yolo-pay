import 'package:flutter/material.dart';
import 'package:yolo_intern/Widgets/custom_navbar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(13, 13, 13, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        border: Border(top: BorderSide(color: Colors.white)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomNavbarItem(img: 'assets/images/home.png', label: 'home'),
          CustomNavbarItem(
            img: 'assets/images/home.png',
            label: 'yolo pay',
            isSelected: true,
          ),
          CustomNavbarItem(img: 'assets/images/ginie.png', label: 'ginie'),
        ],
      ),
    );
  }
}
