import 'package:aula_ramon/presentation/choose_example/choose_example_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const CategoryListCubitPage(
      //   title: 'Flutter Demo Cubit',
      // ),
      // home: const CategoryListBlocPage(
      //   title: 'Flutter Demo BLoC',
      // ),
      home: const ChoseExamplePage(
        title: 'Flutter Demo',
      ),
    );
  }
}
