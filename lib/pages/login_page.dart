import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/rectangle_button.dart';
import './home.dart';
import './signup_page.dart'; // Importing SignUp Page

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // Background gradient for a modern feel
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Custom Sign In Header
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                              offset: const Offset(2, 2),
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.4)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),

                    // Email Text Field with custom decoration
                    _buildTextField(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      isPassword: false,
                    ),

                    const SizedBox(height: 20),

                    // Password Text Field with custom decoration
                    _buildTextField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      isPassword: true,
                    ),

                    const SizedBox(height: 40),

                    // Login Button
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: RectangleButton(
                        onPressed: () {
                          // Logic to check login credentials can go here.
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Sign Up Button instead of Forgot Password
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom Text Field Builder for reusability with better visual effects
  Widget _buildTextField({
    required String labelText,
    required String hintText,
    required bool isPassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Slightly transparent background
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 4),
            blurRadius: 8, // Enhanced shadow for more depth
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          labelStyle: const TextStyle(color: Colors.deepPurple),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
          ),
        ),
      ),
    );
  }
}
