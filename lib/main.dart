import 'package:flutter/material.dart';

import 'Screen/ProductCreateScreen.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crud App',
      home: ProductCreateScreen()
    );
  }
}
