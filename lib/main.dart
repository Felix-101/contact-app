import 'package:flutter/material.dart';
import 'screens/contact_screen.dart';
import 'screens/add_contact_screen.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
/*  const ProviderScope(
child: MyApp(),),*/
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const ContactScreen(),
      routes: {
        '/new-contact': (context) => const NewContatcView(),
      },
    );
  }
}
