import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prac1/models/news_model.dart';
import 'package:prac1/screens/Main_Page.dart';
import 'package:prac1/screens/Sign_inPage.dart/sign_up.dart';
import 'package:prac1/screens/search/search_page.dart';

class Myroutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/main':
        return MaterialPageRoute(builder: (context) => const MainPage());
      case '/search':
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case '/sign_up':
        return MaterialPageRoute(builder: (context) => const SignUpPage());
    }
  }
}
