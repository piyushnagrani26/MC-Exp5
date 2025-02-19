import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/rectangle_button.dart';
import './login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String gender = "Male";
  String meditationType = "Mindfulness";
  double sessionDuration = 10;

  /// Function to save user data in Hive
  Future<void> _saveUserData() async {
    var box = await Hive.openBox('users');

    // Check if email is already registered
    if (box.containsKey(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Email already registered! Please log in.')),
      );
      return;
    }

    // Save user details in Hive
    box.put(emailController.text, {
      'name': nameController.text,
      'age': ageController.text,
      'gender': gender,
      'meditationType': meditationType,
      'sessionDuration': sessionDuration,
      'password': passwordController.text, // Store password for authentication
    });

    print(
        "Stored users in Hive: ${box.toMap()}"); // Debugging: Print stored users

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User Registered Successfully!')),
    );

    // Navigate to Login Page after successful registration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

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
                    const SizedBox(height: 40),
                    _buildTextField(
                        controller: nameController,
                        labelText: 'Name',
                        hintText: 'Enter your full name',
                        isPassword: false),
                    const SizedBox(height: 20),
                    _buildTextField(
                        controller: ageController,
                        labelText: 'Age',
                        hintText: 'Enter your age',
                        isPassword: false),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text("Gender:"),
                        Radio(
                          value: "Male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const Text("Male"),
                        Radio(
                          value: "Female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const Text("Female"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<String>(
                      value: meditationType,
                      items: [
                        'Mindfulness',
                        'Transcendental',
                        'Zen',
                        'Vipassana'
                      ].map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          meditationType = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Text("Session Duration: ${sessionDuration.toInt()} mins"),
                    Slider(
                      value: sessionDuration,
                      min: 5,
                      max: 60,
                      divisions: 11,
                      label: sessionDuration.toInt().toString(),
                      onChanged: (double value) {
                        setState(() {
                          sessionDuration = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                        controller: emailController,
                        labelText: 'Email',
                        hintText: 'Enter your email address',
                        isPassword: false),
                    const SizedBox(height: 20),
                    _buildTextField(
                        controller: passwordController,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        isPassword: true),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: RectangleButton(
                        onPressed: _saveUserData,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
    required TextEditingController controller,
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
        controller: controller,
        obscureText: isPassword,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          labelText: labelText,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
