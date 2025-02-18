import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/rectangle_button.dart';
import './login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            offset: const Offset(2, 2),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    _buildTextField(
                        labelText: 'Name',
                        hintText: 'Enter your full name',
                        isPassword: false),
                    const SizedBox(height: 20),
                    _buildTextField(
                        labelText: 'Age',
                        hintText: 'Enter your age',
                        isPassword: false),
                    const SizedBox(height: 20),
                    _buildTextField(
                        labelText: 'Gender',
                        hintText: 'Enter your gender M/F',
                        isPassword: false),
                    const SizedBox(height: 20),
                    _buildTextField(
                        labelText: 'Email',
                        hintText: 'Enter your email address',
                        isPassword: false),
                    const SizedBox(height: 20),
                    _buildTextField(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        isPassword: true),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: RectangleButton(
                        onPressed: () {
                          // Sign-up logic goes here
                        },
                        child: const Text(
                          'Sign Up',
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Already have an account? Login',
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

  Widget _buildTextField({
    required String labelText,
    required String hintText,
    required bool isPassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 4),
            blurRadius: 8,
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
