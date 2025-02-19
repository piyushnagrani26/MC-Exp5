import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // ✅ Import Hive
import './pages/home.dart';
import 'theme.dart';
import './pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Ensure Flutter initializes
  await Hive.initFlutter(); // ✅ Initialize Hive
  await Hive.openBox('users'); // ✅ Open 'users' box

  runApp(const App()); // ✅ Fix MyApp -> App
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme(),
      home: const AuthWrapper(), // ✅ Ensure AuthWrapper exists
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const Home() : const LoginPage();
  }
}
