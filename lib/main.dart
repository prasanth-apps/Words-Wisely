import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words_wisely/routes.dart';

void main() {
  runApp(const WordsWisely());
}

class WordsWisely extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: '/splash', getPages: approutes());
  }
}
