import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product_details.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/verify_phone.dart';

import '../screens/shared/favorite_screen.dart';
import '../screens/shared/help_screen.dart';
import '../screens/shared/home_screen.dart';
import '../screens/shared/login_screen.dart';
import '../screens/shared/notification_screen.dart';
import '../screens/shared/setting_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/verify':
        return MaterialPageRoute(builder: (_) => VerifyPhone());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => HelpScreen());
      case '/favorite':
        return MaterialPageRoute(builder: (_) => FavoriteScreen());
      case '/notification':
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case '/setting':
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case '/product':
        return MaterialPageRoute(
            builder: (_) => ProductsDetails(
                  data: settings.arguments,
                ));
      default:
        return null;
    }
  }
}
