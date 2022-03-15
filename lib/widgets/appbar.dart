import 'package:flutter/material.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/iconConst.dart';

class MyAppbar {
  static get myAppbar => AppBar(
      shadowColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconConst.logo,
          SizedBox(
            width: getWidth(10),
          ),
          const Text(
            'News 24',
            style: TextStyle(
              color: ColorsConst.black,
            ),
          ),
        ],
      ),
      actions: [IconConst.notification],
    );
}