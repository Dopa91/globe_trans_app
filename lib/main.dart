import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/themes.dart';
import 'package:globe_trans_app/database_repository.dart';
import 'package:globe_trans_app/features/register_feature/presentation/homescreen/home_screen.dart';
import 'package:globe_trans_app/mock_database.dart';

void main() async {
  final repository = MockDatabase();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required DatabaseRepository repository});

  final DatabaseRepository repository = MockDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlobeTransMessage',
      theme: myTheme,
      home: HomeScreen(
        repository: repository,
      ),
    );
  }
}
