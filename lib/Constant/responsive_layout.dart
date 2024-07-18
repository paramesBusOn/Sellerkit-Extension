import 'package:flutter/material.dart';

class ResponsiveLayoutPage extends StatelessWidget {
  ResponsiveLayoutPage(
      {super.key, required this.tapLandsscap, required this.tapPortraid});
  Widget tapLandsscap;
  Widget tapPortraid;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 1300) {
        return tapLandsscap;
      } else {
        return tapPortraid;
      }
    });
  }
}
