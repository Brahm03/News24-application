import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/fontweight.dart';
import 'package:prac1/models/news_model.dart';
import 'package:prac1/screens/info/info_page.dart';
import 'package:prac1/service/apple_service.dart';
import 'package:prac1/service/buisness.dart';
import 'package:prac1/service/headline.dart';
import 'package:prac1/service/testla_service.dart';
import 'package:prac1/service/wallstreetJournal.dart';
import 'package:prac1/widgets/appbar.dart';
import 'package:prac1/widgets/catog.dart';
import 'package:prac1/widgets/news.dart';
import 'package:prac1/widgets/offlinenews.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isConnected = false;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  String? status;
  int current = 0;
  final List _cat = ["Apple", "Tesla", "Business", "Domains", "Technology"];
  List<Box<Article>> futures = [
    ServiceNewsApple.mybox as Box<Article>,
    ServiceNewsTestla.mybox as Box<Article>,
    ServiceNewsBusiness.mybox as Box<Article>,
    ServiceNewsWallStreet.mybox as Box<Article>,
    ServiceNewsHeadLine.mybox as Box<Article>,
  ];
  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.myAppbar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 10.0),
            child: SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) {
                    return MyElevetedButton(
                        currentPage: current,
                        onpressed: () {
                          setState(
                            () {
                              current = i;
                            },
                          );
                        },
                        text: _cat[i],
                        index: i);
                  },
                  itemCount: _cat.length,
                )),
          ),
          Expanded(
              flex: 10,
              child: isConnected
                  ? FutureBuilder(
                      future: Future.wait([
                        ServiceNewsApple.getData(),
                        ServiceNewsTestla.getData(),
                        ServiceNewsBusiness.getData(),
                        ServiceNewsWallStreet.getData(),
                        ServiceNewsHeadLine.getData(),
                      ]),
                      builder: (context, AsyncSnapshot<List<NewsModel>> snap) {
                        if (!snap.hasData) {
                          return const Center(
                              child: SpinKitPianoWave(
                            color: ColorsConst.black,
                          ));
                        } else if (snap.hasError) {
                          return const Center(
                            child: Text("NoData"),
                          );
                        } else {
                          var data = snap.data!;
                          return ListView.builder(
                            itemBuilder: (ctx, i) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onLongPress: () {
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) =>
                                              CupertinoActionSheet(
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Hive.box('saved').add(
                                                            data[current]
                                                                .articles![i]);
                                                        debugPrint(
                                                            Hive.box('saved')
                                                                .getAt(i)
                                                                .toString());
                                                      },
                                                      child: const Text(
                                                        'Add to saved',
                                                        style: TextStyle(
                                                            color: ColorsConst
                                                                .black,
                                                            fontWeight:
                                                                FontweightConst
                                                                    .bold),
                                                      ))
                                                ],
                                              ));
                                    },
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InfoPage(all: [
                                                  data[current].articles![i],
                                                  i
                                                ]))),
                                    child: FadeInLeftBig(
                                      child: Hero(
                                        tag: i,
                                        child: NewsContainer(
                                            index: i, newsModel: data[current]),
                                      ),
                                    ),
                                  ));
                            },
                            itemCount: data[current].articles!.length,
                          );
                        }
                      },
                    )
                  : futures[current].isNotEmpty
                      ? SizedBox(
                          child: ListView.builder(
                            itemBuilder: (ctx, i) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: FadeInDownBig(
                                      child: OfflineNews(
                                          futures: futures,
                                          current: current,
                                          i: i),
                                    ),
                                  ));
                            },
                            itemCount: futures[current].length,
                          ),
                        )
                      : const Center(child: Text("No Internet")))
        ],
      ),
    );
  }

  check() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        isConnected = true;
        setState(() {});
      } else {
        isConnected = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }
}
