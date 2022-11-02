import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_101/column_row_learn.dart';
import 'package:flutter_101/demo/color_demos_view.dart';
import 'package:flutter_101/demo/color_lifecycle_view.dart';
import 'package:flutter_101/demo/my_collections_demos.dart';
import 'package:flutter_101/demo/note_demo.dart';
import 'package:flutter_101/life_cycle.dart';
import 'package:flutter_101/list_tile_learn.dart';
import 'package:flutter_101/list_view_builder_learn.dart';
import 'package:flutter_101/page_view_learn.dart';
import 'package:flutter_101/scaffold_learn_view.dart';
import 'package:flutter_101/stack_learn.dart';
import 'package:flutter_101/statefull_learn.dart';
import 'package:flutter_101/text_learn_view.dart';
import 'package:flutter_101/textfield_learn.dart';

import 'appbar_learn.dart';
import 'button_learn.dart';
import 'container_sizedbox.dart';
import 'custom_widgets.dart';
import 'demo/stack_demo_view.dart';
import 'icon_learn.dart';
import 'indicator_learn.dart';
import 'navigation_learn.dart';

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
      theme: ThemeData.dark().copyWith(
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
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.blueGrey,
          iconColor: Colors.red,
          border: OutlineInputBorder(),
        ),
      ),
      home: NavigationLearn(),
    );
  }
}
