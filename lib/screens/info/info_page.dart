import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/PM_const.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/fontweight.dart';
import 'package:prac1/core/constants/iconConst.dart';
import 'package:prac1/core/constants/radiusconst.dart';
import 'package:prac1/models/news_model.dart';

class InfoPage extends StatelessWidget {
  final List all;
  const InfoPage({required this.all,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 954,
              child: Column(children: [
                LimitedBox(
                  maxHeight: 80,
                  maxWidth: double.infinity,
                  child: Row(
                    children: [
                      const BackButton(),
                      const Spacer(),
                      IconConst.saved,
                      const Icon(Icons.file_download_outlined)
                    ],
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Hero(
                        tag: all[1],
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            height: getHeight(229),
                            width: double.infinity,
                            placeholder: const AssetImage('assets/images/loadingGif.gif'),
                            image: NetworkImage(all[0].urlToImage  ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png')
                        ),
                      ),
                      Padding(
                        padding: PaddingMarginConst.small,
                        child: SizedBox(
                          height: getHeight(148),
                          width:  getWidth(358),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Text(all[0].title.toString(),style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),)),
                              Expanded(child: ListTile(leading: CircleAvatar(radius: RadiusConst.lare,foregroundImage: NetworkImage(all[0].urlToImage.toString())),title: Text('by ${all[0].author.toString()})'),))
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.mode_comment_outlined) , Text('comments'), Icon(CupertinoIcons.suit_heart), Text('likes'), Icon(Icons.share), Text('Share')
                        ],
                      ),
                      Padding(
                        padding: PaddingMarginConst.small,
                        child:
                      Text(all[0].description.toString(), style: const TextStyle(fontSize: 23, fontWeight: FontweightConst.w3),)
                      )],
                ),
                    ),
              ]),
            ),
          ),
        ),
    );
  }
}
