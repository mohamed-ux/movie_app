import 'package:flutter/material.dart';
import 'package:movie_app/core/componants/movie_details_details.dart';
import 'package:movie_app/layout/home_layout.dart';

import 'core/style/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        MovieDetailsWidget.routeName: (context) => MovieDetailsWidget(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
