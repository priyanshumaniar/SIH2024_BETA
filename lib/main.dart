import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

import '../utils/route_constants.dart';
import '../utils/route_config.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: const FirebaseOptions(
//           apiKey: "AIzaSyD8c3m-9V63HK55Z_XsZ2M29vaxSU-8Qes", /////////////
//           appId: "1:909766008508:android:3dc036b41523e2a44dbab9",
//           messagingSenderId: "692326915698", //////
//           projectId: "sih2024-1db1b"));
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: landingRoute,
      onGenerateRoute: RouteConfig.generateRoute,
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to my app!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }