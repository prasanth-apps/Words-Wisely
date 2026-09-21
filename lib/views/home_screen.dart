import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:words_wisely/controllers/api_controller.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

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
      backgroundColor: Colors.white,
      body: Obx(() {
        final quote = apiController.quote.value;
        if (quote == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Container(
            height: 400,
            width: 350,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(quote.q, style: GoogleFonts.poppins(fontSize: 30)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        quote.a,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.favorite, color: Colors.red, size: 40),
                      IconButton(
                        onPressed: () {
                          final quote = apiController.fetchQuote();
                        },
                        icon: Icon(Icons.navigate_next, size: 45),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
