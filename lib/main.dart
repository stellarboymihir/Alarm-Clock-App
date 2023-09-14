import 'package:clock_app/enum.dart';
import 'package:clock_app/model/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChangeNotifierProvider<MenuInfo>(
          create: (context) =>
              MenuInfo(MenuType.clock, title: '', imageSource: ''),
          child: const HomePage(),
        ));
  }
}
