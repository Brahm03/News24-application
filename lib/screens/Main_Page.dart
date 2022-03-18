// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/PM_const.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/iconConst.dart';
import 'package:prac1/screens/add/saved_page.dart';
import 'package:prac1/screens/home/home_page.dart';
import 'package:prac1/screens/search/search_page.dart';
import 'package:prac1/screens/settings/settings_page.dart';
import 'package:prac1/service/apple_service.dart';
import 'package:prac1/service/buisness.dart';
import 'package:prac1/service/headline.dart';
import 'package:prac1/service/testla_service.dart';
import 'package:prac1/service/wallstreetJournal.dart';
import 'package:prac1/widgets/appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    setState(() {});
  }

  int index = 0;
  int value1 = 0;
  int value2 = 1;
  int value3 = 2;
  int value4 = 3;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:  SafeArea(
        child: TabBarView(controller: _controller, children: const[
                 HomePage(),
                 SearchPage(),
                 SavedPage(),
                 SettingsPage(names: [],)
              ]),
      ),
      bottomNavigationBar: TabBar(
          onTap: ((value) {
            setState(() {
              index = value;
            });
          }),
          indicatorSize: TabBarIndicatorSize.label,
          padding: PaddingMarginConst.small,
          controller: _controller,
          indicatorColor: ColorsConst.white,
          tabs: [
            Tab(
              icon: index == value1 ? IconConst.homedark : IconConst.home,
            ),
            Tab(
              icon: index == value2 ? IconConst.searchdark : IconConst.search,
            ),
            Tab(
              icon: index == value3 ? IconConst.saveddark : IconConst.saved,
            ),
            Tab(
              icon:
                  index == value4 ? IconConst.settingsdark : IconConst.settings,
            ),
          ]),
    );
  }
}

// 