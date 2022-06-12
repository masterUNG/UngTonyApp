import 'package:flutter/material.dart';
import 'package:ungtonyapp/states/authen.dart';
import 'package:ungtonyapp/states/introduction.dart';
import 'package:ungtonyapp/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  MyConstant.rountIntro:(context) => const Introduction(),
  MyConstant.rountAuthen:(context) => const Authen(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: MyConstant.rountIntro,
    );
  }
}
