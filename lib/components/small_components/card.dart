

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';


class CardWidget extends StatefulWidget {
  const CardWidget(this.width, this.height , {super.key});
  final double width;
  final double height;

  @override
  State<CardWidget> createState() => _CardState();
}

class _CardState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    double height = widget.height;
    double width = widget.width;

    return Container(
      width: width,
      height: height,
      child: Container(

      ),

    );
  }
}