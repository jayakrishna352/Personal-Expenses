import 'package:flutter/material.dart';
import './screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PersonalExpenses());
}

class PersonalExpenses extends StatelessWidget {
  const PersonalExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
    );
  }
}