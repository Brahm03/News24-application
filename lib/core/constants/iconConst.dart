import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prac1/core/constants/colorConst.dart';

class IconConst {
  static  SvgPicture home =  SvgPicture.asset('assets/icons/home.svg');
  static  SvgPicture homedark =  SvgPicture.asset('assets/icons/homeblack.svg');
  static  SvgPicture search =  SvgPicture.asset('assets/icons/search.svg');
  static  SvgPicture searchdark =  SvgPicture.asset('assets/icons/searchblack.svg');
  static  SvgPicture logo =  SvgPicture.asset('assets/icons/logo.svg');
  static  SvgPicture more =  SvgPicture.asset('assets/icons/more.svg', color: AdaptiveThemeMode.dark == true ? ColorsConst.white: ColorsConst.black);
  static  SvgPicture saved =  SvgPicture.asset('assets/icons/saved.svg');
  static  SvgPicture saveddark =  SvgPicture.asset('assets/icons/savedblack.svg');
  static  SvgPicture settings =  SvgPicture.asset('assets/icons/settings.svg');
  static  SvgPicture settingsdark =  SvgPicture.asset('assets/icons/settingsblack.svg');
  static  SvgPicture notification =  SvgPicture.asset('assets/icons/noti.svg');
  static Image commets = Image.asset('assets/images/comments.png' ,height: 30,);
  static Image likes = Image.asset('assets/images/likes.png');
  static Image share = Image.asset('assets/images/share.png');
}
