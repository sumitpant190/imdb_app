import 'package:flutter/material.dart';
import 'package:imdb_app/utils/routes/route_name.dart';
import 'package:imdb_app/views/home.dart';
import 'package:imdb_app/views/login_view.dart';

import '../../views/signup_view.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => Home());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No defined Route'),
            ),
          );
        });
    }
  }
}
