import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prac1/models/news_model.dart';
import 'package:prac1/screens/Main_Page.dart';
import 'package:prac1/screens/Sign_inPage.dart/sign_up.dart';
import 'package:prac1/screens/info/info_page.dart';
import 'package:prac1/screens/search/search_page.dart';
import 'package:prac1/screens/settings/profile_page.dart';

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
      case '/profile':
        return MaterialPageRoute(builder: ((context) => const ProfilePage()));
      case '/info':
        return MaterialPageRoute(builder: ((context) => InfoPage(all: args as List,)));  
    }
  }
}
