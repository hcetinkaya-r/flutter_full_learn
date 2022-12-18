import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_101/202/cache/user_cache/user_shared_list_cache.dart';
import 'package:flutter_101/202/form_learn_view.dart';
import 'package:flutter_101/202/sheet_learn.dart';
import 'package:flutter_101/303/call_back_learn.dart';
import 'package:flutter_101/303/lottie_learn.dart';
import 'package:flutter_101/product/global/resource_context.dart';
import 'package:flutter_101/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

import '101/textfield_learn.dart';
import '202/alert_learn.dart';
import '202/cache/secure_context/secure_context_learn.dart';
import '202/cache/shared_learn_cache.dart';
import '202/image_learn.dart';
import '202/oop_learn_view.dart';
import '202/package_learn_view.dart';
import '202/services/service_learn_get_view.dart';
import '202/animated_learn_view.dart';
import '202/theme/light_theme_data.dart';
import '303/part/part_of_learn.dart';
import '303/regres_resources/view/regres_view.dart';
import '303/tabbar_advance_learn.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ResourceContext()),
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
        ),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Full Learn',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
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
      home: LottieLearn(),
    );
  }
}
