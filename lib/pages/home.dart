import 'package:flutter/material.dart';
import 'package:meditation_app/pages/dashboard.dart';
import 'package:meditation_app/widgets/rectangle_button.dart';
import '../utils/utils.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Meditation Image
                Image.asset("assets/images/meditation.png"),

                // Main Heading
                const Text(
                  "Time to meditate",
                  style: kLargeTextStyle,
                  textAlign: TextAlign.center,
                ),

                // Subheading
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Take a breath,\nand ease your mind",
                    style: kMeduimTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 50), // Spacing

                // "Let's Get Started" Button
                RectangleButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dashboard(),
                    ),
                  ),
                  child: const Text(
                    "Let's get started",
                    style: kButtonTextStyle,
                  ),
                ),

                const SizedBox(height: 30), // Spacing

                // QR Code Section
                Column(
                  children: [
                    const Text(
                      "Scan to Find the Best Relaxing Music",
                      style: kMeduimTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Image.asset(
                        "assets/images/spotify_qr.png", // QR Code Image
                        width: 200, // Adjust size
                        height: 200,
                        fit: BoxFit.contain, // Ensures proper scaling
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
