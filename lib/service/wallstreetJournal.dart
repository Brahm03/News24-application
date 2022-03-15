import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prac1/core/constants/apiConst.dart';
import 'package:prac1/models/news_model.dart';

class ServiceNewsWallStreet {
  static Box<Article>? mybox;
  static Future<NewsModel> getData() async {
    try {
      await openBox();
      Response res = await Dio().get(Api.wallstreetJournal);
      await putData(NewsModel.fromJson(res.data));
      return NewsModel.fromJson(res.data);
    } catch (e) {
      Exception(e);
      return NewsModel();
    }
  }
  static openBox() async {
    mybox = await Hive.openBox('wallstreet');
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  static putData(NewsModel model) {
    mybox!.clear();

    for (var item in model.articles!) {
      mybox!.add(item);
    }
  }
}
