import 'package:flutter/material.dart';
import 'reusable.dart';
import 'const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 class BottomPage extends StatelessWidget {
   BottomPage({required this.titlename,required this.onTap});
   final String titlename;
   VoidCallback onTap;

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap:onTap,
       child: Container(
         margin: EdgeInsets.only(top: 10.0),
         width: double.infinity,
         padding:EdgeInsets.fromLTRB(100, 25, 20, 10),
         height: 80.0,
         color: kBottomContainerColor,
         child: Text(titlename,style: kNumbertextstyle,),
       ),
     );
   }
 }

