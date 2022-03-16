import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/PM_const.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/models/news_model.dart';
import 'package:prac1/service/apple_service.dart';
import 'package:prac1/service/buisness.dart';
import 'package:prac1/service/headline.dart';
import 'package:prac1/service/testla_service.dart';
import 'package:prac1/service/wallstreetJournal.dart';
import 'package:prac1/widgets/news.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _value = 0;

  final Set<NewsModel> _temp = {};

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: FutureBuilder(
            future: Future.wait([
              ServiceNewsApple.getData(),
              ServiceNewsTestla.getData(),
              ServiceNewsHeadLine.getData(),
              ServiceNewsBusiness.getData(),
              ServiceNewsWallStreet.getData(),
            ]),
            builder: (context, AsyncSnapshot<List<NewsModel>> snap) {
              if (!snap.hasData) {
                return const Center(
                  child: SpinKitPianoWave(color: ColorsConst.black),
                );
              } else if (snap.hasError) {
                return const Center(
                  child: Text('Connection lost'),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: getHeight(40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: FadeInRightBig(
                          child: CupertinoSearchTextField(
                            onChanged: (value) {
                              _temp.clear();
                              for (NewsModel item in snap.data!) {
                                if (value.isEmpty) {
                                  _temp.clear();
                                  setState(() {});
                                } else if (item.articles![_value].title
                                    .toString()
                                    .toLowerCase()
                                    .contains(value.toString().toLowerCase())) {
                                  _temp.add(item);
                                  setState(() {});
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        children: [
                          Padding(
                            padding: PaddingMarginConst.small,
                            child: Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  const Spacer(),
                                  DropdownButton(
                                      value: _value,
                                      items: const [
                                        DropdownMenuItem<int>(
                                          child: Text('Appple news'),
                                          value: 0,
                                        ),
                                        DropdownMenuItem<int>(
                                          child: Text('Tesla news'),
                                          value: 1,
                                        ),
                                        DropdownMenuItem<int>(
                                          child: Text('Business news'),
                                          value: 2,
                                        ),
                                        DropdownMenuItem<int>(
                                          child: Text('Wall Street news'),
                                          value: 3,
                                        ),
                                        DropdownMenuItem<int>(
                                          child: Text('HeadLine Usa news'),
                                          value: 4,
                                        ),
                                      ],
                                      onChanged: (v) {
                                        _value = v as int;
                                        setState(() {});
                                      }),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 10,
                              child: _temp.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: _temp.length,
                                      itemBuilder: (_, __) {
                                        return NewsContainer(
                                            index: __,
                                            newsModel: _temp.toList()[_value]);
                                      })
                                  : const Center(child: Text('nothing searched yet'),))
                        ],
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
