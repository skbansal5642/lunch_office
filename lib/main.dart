import 'package:flutter/material.dart';
import 'package:lunch_office/home_page.dart';
import 'package:lunch_office/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Lunch Office',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade100),
          useMaterial3: true,
        ),
        initialRoute: HomePageScreen.route,
        routes: {
          HomePageScreen.route: (context) => const HomePageScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
