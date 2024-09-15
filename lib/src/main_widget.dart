import 'package:bibliasagrada/shared/injections/injections.dart';
import 'package:bibliasagrada/shared/routes/routes_named.dart';
import 'package:bibliasagrada/src/routes.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    init();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bíblia Sagrada',
      initialRoute: RoutesNamed.homePage,
      routes: routes,
    );
  }
}
