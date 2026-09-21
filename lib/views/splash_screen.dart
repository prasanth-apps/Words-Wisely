import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offNamed('/home');
          },
          child: const Text("Let's Start"),
        ),
      ),
    );
  }
}
