import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '202/package_learn_view.dart';
import '202/services/service_learn_get_view.dart';
import '202/theme/light_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Full Learn',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      /* ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          iconTheme: IconThemeData(color: Colors.cyan.shade300, size: 30),
          cardTheme: const CardTheme(
            color: Colors.grey,
            shape: StadiumBorder(),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.red),
          listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.blueGrey,
            iconColor: Colors.red,
            border: OutlineInputBorder(),
          ),
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            shape: CircularNotchedRectangle(),
            color: Colors.blueGrey,
          )), */
      home: const PackageLearnView(),
    );
  }
}
