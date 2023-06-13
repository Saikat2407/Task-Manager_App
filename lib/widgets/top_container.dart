import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  TopContainer({
    required this.height, required this.width, required this.child, required this.padding
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding!=null ? padding : EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
          color: Color(0xffffb969),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            // topLeft: Radius.circular(40.0),
            // topRight:  Radius.circular(40.0)
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
