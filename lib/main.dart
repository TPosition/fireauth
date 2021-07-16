import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/auth_selector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Entry());
}

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example App',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Loading();
    }

    return AuthTypeSelector();
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'SomethingWentWrong',
        textDirection: TextDirection.ltr,
      ),
    ));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'Loading',
        textDirection: TextDirection.ltr,
      ),
    ));
  }
}

class MyAwesomeApp extends StatelessWidget {
  const MyAwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'MyAwesomeApp',
        textDirection: TextDirection.ltr,
      ),
    ));
  }
}
