import 'package:flutter/material.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/fontsize.dart';
import 'package:prac1/core/constants/fontweight.dart';

class Saved_Page extends StatelessWidget {
  const Saved_Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1,child: Padding(padding: EdgeInsets.only(left: 10,top: 20),child: Text('BookMarked', style: TextStyle(fontSize: FontSize.medium, fontWeight: FontweightConst.bold),))),
            Expanded(flex: 10,child: Container(color: ColorsConst.black,))
          ],
        ),
      ),
    );
  }
}