import 'package:flutter/material.dart';
import 'package:shop/core/utils/string.dart';
import 'package:shop/features/auth/views/log_in_view.dart';
import 'package:shop/features/auth/views/sign_up.dart';
import 'package:shop/features/home/view/home_view.dart';
import 'package:shop/features/onBoarding/view/onBoarding1_view.dart';
import 'package:shop/features/profile/view/profile_part.dart';
import 'package:shop/features/settings/view/setting_language.dart';

import 'package:shop/features/splash/view/splash_view.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.SplashScreen_view:
        return MaterialPageRoute(builder: (_) => SplashScreen_view());

      case Routes.SignUp_view:
        return MaterialPageRoute(builder: (_) => SignUp_view());

      case Routes.Login_view:
        return MaterialPageRoute(builder: (_) => Login_view());

      case Routes.Lanuage_view:
        return MaterialPageRoute(builder: (_) => Lanuage_view());

      case Routes.MyProfile_view:
        return MaterialPageRoute(builder: (_) => MyProfile_view());

      case Routes.HomeScreenBody:
        return MaterialPageRoute(builder: (_) => HomeScreenBody());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('NO route ${settings.name} ')),
              ),
        );
    }
  }
}
