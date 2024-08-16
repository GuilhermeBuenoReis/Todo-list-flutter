import 'package:flutter/material.dart';
import 'package:todo_list/Colors/colors.dart';

class Header extends StatelessWidget {
  final String imageUrl; 

  const Header({required this.imageUrl, super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 174.0,
      color: DefaultTheme.gray700,
      child: Center(
        child: Image.asset(imageUrl)
      ),
    );
  }
}