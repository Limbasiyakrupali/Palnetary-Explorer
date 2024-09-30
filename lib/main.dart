import 'package:flutter/material.dart';
import 'package:planetary_explorer/provider/favourite_provider.dart';
import 'package:planetary_explorer/provider/theme_provider.dart';
import 'package:planetary_explorer/views/screens/detailpage.dart';
import 'package:planetary_explorer/views/screens/favourite_page.dart';
import 'package:planetary_explorer/views/screens/homepage.dart';
import 'package:planetary_explorer/views/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(create: (context) => FavoriteProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<ThemeProvider>(context).istapped)
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'home': (context) => HomePage(),
        'detail_page': (context) => DetailPage(),
        'favourite_page': (context) => FavouritePage(),
      },
    );
  }
}
