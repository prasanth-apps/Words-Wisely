import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:words_wisely/controllers/api_controller.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.find<ApiController>();
    return Scaffold(
      appBar: AppBar(title: Text("Words Wisely")),
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
                          apiController.fetchQuote();
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
    );
  }
}
