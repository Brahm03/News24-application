import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prac1/core/components/theme_app.dart';
import 'package:prac1/models/news_model.dart';
import 'package:prac1/routes/MyRoutes.dart';
import 'package:prac1/service/apple_service.dart';
import 'package:prac1/service/buisness.dart';
import 'package:prac1/service/headline.dart';
import 'package:prac1/service/testla_service.dart';
import 'package:prac1/service/wallstreetJournal.dart';

void main() async {
  await Hive.initFlutter();
  await dotenv.load(fileName: '.env');
  Hive.registerAdapter(NewsModelAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());
  await ServiceNewsApple.openBox();
  await ServiceNewsBusiness.openBox();
  await ServiceNewsHeadLine.openBox();
  await ServiceNewsTestla.openBox();
  await ServiceNewsWallStreet.openBox();
  await Hive.openBox('saved');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Myroutes _myroutes = Myroutes();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: Themeapp.light,
        dark: Themeapp.dark,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News 24',
            theme: light,
            darkTheme: dark,
            initialRoute: '/main',
            onGenerateRoute: _myroutes.onGenerateRoute,
          );
        });
  }
}
