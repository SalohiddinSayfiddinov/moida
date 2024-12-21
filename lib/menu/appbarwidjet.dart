import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appbarwidjet extends StatelessWidget {
  const Appbarwidjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      InkWell
      (
        onTap: (){},child: Container(padding: EdgeInsets.all(8),
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        
        ),child: Icon(CupertinoIcons.bars
        ),
        ),
      ), InkWell
      (
        onTap: (){},child: Container(padding: EdgeInsets.all(8),
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        ),child: Icon(Icons.notifications
        ),
        ),
      )
    ],),);
  }
}