import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  late final Color color;
  final Widget? child;
  final Function()? onPress;

  ReusableCard({required this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: this.child,
      ),
    );
  }
}
