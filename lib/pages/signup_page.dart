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
  final TextEditingController meditationGoalController =
      TextEditingController();

  String gender = "Male";
  String meditationType = "Mindfulness";
  double sessionDuration = 10;
  String experienceLevel = "Beginner";
  List<String> preferredTimes = [];
  bool receivesReminders = false;

  Future<void> _saveUserData() async {
    var box = await Hive.openBox('users');

    if (box.containsKey(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Email already registered! Please log in.')),
      );
      return;
    }

    box.put(emailController.text, {
      'name': nameController.text,
      'age': ageController.text,
      'gender': gender,
      'meditationType': meditationType,
      'sessionDuration': sessionDuration,
      'experienceLevel': experienceLevel,
      'preferredTimes': preferredTimes,
      'receivesReminders': receivesReminders,
      'meditationGoal': meditationGoalController.text,
      'password': passwordController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User Registered Successfully!')),
    );

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
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 40),
                    _buildBorderedContainer(
                      _buildTextField(nameController, 'Name',
                          'Enter your full name', false),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildTextField(
                          ageController, 'Age', 'Enter your age', false),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildGenderSelection(),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildDropdown('Meditation Type', [
                        'Mindfulness',
                        'Transcendental',
                        'Zen',
                        'Vipassana'
                      ], (val) {
                        setState(() => meditationType = val);
                      }, meditationType),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildExperienceLevelSelection(),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildPreferredTimesSelection(),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildReminderSwitch(),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildSlider('Session Duration', 5, 60, sessionDuration,
                          (val) {
                        setState(() => sessionDuration = val);
                      }),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildTextField(emailController, 'Email',
                          'Enter your email address', false),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildTextField(passwordController, 'Password',
                          'Enter your password', true),
                    ),
                    const SizedBox(height: 20),
                    _buildBorderedContainer(
                      _buildTextField(meditationGoalController,
                          'Meditation Goal', 'Why do you meditate?', false),
                    ),
                    const SizedBox(height: 40),
                    RectangleButton(
                        onPressed: _saveUserData,
                        child: const Text('Sign Up',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white))),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage())),
                      child: const Text('Already have an account? Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              decoration: TextDecoration.underline)),
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

  Widget _buildTextField(TextEditingController controller, String label,
      String hint, bool isPassword) {
    return TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: InputBorder.none,
        ));
  }

  Widget _buildDropdown(String label, List<String> items,
      Function(String) onChanged, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, color: Colors.black87)),
        DropdownButton<String>(
            value: value,
            isExpanded: true,
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (val) => onChanged(val!)),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender',
            style: TextStyle(fontSize: 16, color: Colors.black87)),
        Row(
          children: ['Male', 'Female']
              .map((g) => Row(children: [
                    Radio(
                        value: g,
                        groupValue: gender,
                        onChanged: (val) => setState(() => gender = val!)),
                    Text(g)
                  ]))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildExperienceLevelSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Experience Level',
            style: TextStyle(fontSize: 16, color: Colors.black87)),
        Column(
          children: ['Beginner', 'Intermediate', 'Advanced']
              .map((level) => RadioListTile(
                  value: level,
                  groupValue: experienceLevel,
                  title: Text(level),
                  onChanged: (val) => setState(() => experienceLevel = val!)))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildPreferredTimesSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Preferred Times',
            style: TextStyle(fontSize: 16, color: Colors.black87)),
        Column(
          children: ['Morning', 'Afternoon', 'Evening']
              .map((time) => CheckboxListTile(
                  value: preferredTimes.contains(time),
                  title: Text(time),
                  onChanged: (val) => setState(() => val!
                      ? preferredTimes.add(time)
                      : preferredTimes.remove(time))))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildReminderSwitch() {
    return SwitchListTile(
        value: receivesReminders,
        title: const Text('Receive Meditation Reminders?',
            style: TextStyle(fontSize: 16, color: Colors.black87)),
        onChanged: (val) => setState(() => receivesReminders = val));
  }

  Widget _buildSlider(String label, double min, double max, double value,
      Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toInt()} mins',
            style: const TextStyle(fontSize: 16, color: Colors.black87)),
        Slider(
            value: value,
            min: min,
            max: max,
            divisions: 11,
            label: value.toInt().toString(),
            onChanged: onChanged),
      ],
    );
  }

  Widget _buildBorderedContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent, width: 1),
      ),
      child: child,
    );
  }
}
