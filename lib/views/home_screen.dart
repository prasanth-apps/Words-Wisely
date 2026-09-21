import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:words_wisely/controllers/api_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiController apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Words Wisely",
          style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Obx(() {
        final quote = apiController.quote.value;
        if (quote == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Container(
            height: 400,
            width: 400,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(quote.q),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.heat_pump_rounded),
                    IconButton(
                      onPressed: () {
                        final quote = apiController.fetchQuote();
                      },
                      icon: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
