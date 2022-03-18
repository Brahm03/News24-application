import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/fontsize.dart';
import 'package:prac1/core/constants/fontweight.dart';
import 'package:prac1/models/news_model.dart';
import 'package:prac1/widgets/offlinenews.dart';
import 'package:prac1/widgets/savednews.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => SavedPageState();
}

class SavedPageState extends State<SavedPage> {
  Box article = Hive.box('saved');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(splashColor: ColorsConst.lightGrey,backgroundColor: ColorsConst.grey,child: const Icon(CupertinoIcons.delete),onPressed: () {
        article.clear();
        setState(() {});
      }),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      'BookMarked',
                      style: TextStyle(
                          fontSize: FontSize.medium,
                          fontWeight: FontweightConst.bold),
                    ))),
            Expanded(
                flex: 10,
                child: article.isNotEmpty
                    ? ListView.builder(
                        itemCount: article.length,
                        itemBuilder: (_, __) {
                          return InkWell(
                              onTap: () => Navigator.pushNamed(context, '/info',
                                  arguments: [article as Box<Article>, __]),
                              child: Slidable(
                                  endActionPane: ActionPane(children: [
                                    SlidableAction(
                                      onPressed: (v) {
                                        article.deleteAt(__);
                                        setState(() {
                                        });
                                      },
                                      backgroundColor: const Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ], motion: const ScrollMotion()),
                                  child: SavedNews(
                                      saved: article, current: __, i: __)));
                        })
                    : const Center(
                        child: Text('No saved news'),
                      ))
          ],
        ),
      ),
    );
  }
}
