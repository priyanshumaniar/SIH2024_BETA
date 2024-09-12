// import 'package:aju_baju/screens/auth_page.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../utils/route_constants.dart';

class RouteConfig {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // var data = settings.arguments;
    switch (settings.name) {
      // case checkoutRoute:
      //   if (data is CheckoutArgs) {
      //     return MaterialPageRoute(
      //         builder: (_) => Checkout(
      //               data.myaddress,
      //               subtotal: data.subtotal,
      //             ));
      //   } else {
      //     return errorRoute(settings);
      //   }
      // case favouriteRoute:
      //   return MaterialPageRoute(builder: (_) => const Favourite());
      // case authPageRoute:
      //   return MaterialPageRoute(builder: (_) => const AuthPage());
      // case homeRoute:
      //   return MaterialPageRoute(builder: (_) => const Home());
      case landingRoute:
        return MaterialPageRoute(builder: (_) => const Landing());
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(
                  onClickedSignUp: () {},
                ));
      // case myCartRoute:
      //   if (data is MyCartArgs) {
      //     return MaterialPageRoute(builder: (_) => MyCart(data.myCart));
      //   } else {
      //     return errorRoute(settings);
      //   }
      // case myOrdersRoute:
      //   return MaterialPageRoute(builder: (_) => const MyOrders());
      // case onboarding1Route:
      //   return MaterialPageRoute(builder: (_) => const Onboarding1());
      // case onboarding2Route:
      //   return MaterialPageRoute(builder: (_) => const Onboarding2());
      // case onboarding3Route:
      //   return MaterialPageRoute(builder: (_) => const Onboarding3());
      // case paymentRoute:
      //   return MaterialPageRoute(builder: (_) => const Payment());
      // case productDetailsRoute:
      //   return MaterialPageRoute(builder: (_) => const ProductDetails());
      // case profileRoute:
      //   return MaterialPageRoute(builder: (_) => const Profile());
      // case searchRoute:
      //   return MaterialPageRoute(builder: (_) => const Search());
      // case settingsRoute:
      //   return MaterialPageRoute(builder: (_) => const Settings());
      case signUpRoute:
        return MaterialPageRoute(
            builder: (_) => SignUpScreen(
                  onClickedLogIn: () {},
                ));
      // case walletsRoute:
      //   return MaterialPageRoute(builder: (_) => const Wallets());
      default:
        return errorRoute(settings);
    }
  }

  static errorRoute(settings) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
  }
}
