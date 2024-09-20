import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunch_office/screens/consumer.dart';
import 'package:lunch_office/screens/example.dart';
// import 'package:lunch_office/screens/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunch Office',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade100),
        useMaterial3: true,
      ),
      initialRoute: Example.route,
      routes: {
        Example.route: (context) => Example(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
