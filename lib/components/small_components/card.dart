

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';


class CardWidget extends StatefulWidget {
  const CardWidget(this.width, this.height ,this.card_tittle, this.card_value, {super.key});
  final double width;
  final double height;
  final String card_tittle;
  final String card_value;

  @override
  State<CardWidget> createState() => _CardState();
}

class _CardState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    double height = widget.height;
    double width = widget.width;
    String card_tittle = widget.card_tittle;
    String card_value = widget.card_value;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
                 
                  border: Border.all(
                 color: Colors.white
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Card(
             elevation: 20, 
             child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(card_tittle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21,color:Colors.purple, ),),
                  ),
                 const  Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                    indent: 0.5,
                    endIndent: 0.5,
                  ),
                  Text(card_value, style: const TextStyle(fontWeight: FontWeight.w600 
                    , fontSize: 18),), 
                  
              ],
            ),
           
          )
   

    );
  }
}