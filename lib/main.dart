import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/themes.dart';
import 'package:globe_trans_app/features/register_feature/presentation/homescreen/home_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:globe_trans_app/features/shared/mock_database.dart';
import 'package:globe_trans_app/firebase_options.dart';
import 'package:provider/provider.dart';

// void main() async {
//   final repository = MockDatabase();
//   runApp(MyApp(repository: repository));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //final repository = MockDatabase();
  runApp(MultiProvider(providers: [
    Provider<DatabaseRepository>(
      create: (context) => MockDatabase(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final authInstance = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlobeTransMessage',
      theme: myTheme,
      home: const HomeScreen(),
    );
  }
}
