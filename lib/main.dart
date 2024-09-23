import 'package:flutter/material.dart';
import 'package:nectar/home/home_screen.dart';
import 'package:nectar/provider/addscreen_provider.dart';
import 'package:nectar/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => AddscreenProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.route,
      onGenerateRoute: onAppGenerateRoutes(),
    );
  }
}
