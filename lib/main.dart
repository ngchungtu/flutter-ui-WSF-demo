import 'package:flutter/material.dart';
import 'package:plant_app/providers/favorites_provider.dart';
import 'package:plant_app/providers/product_provider.dart';
import 'package:plant_app/providers/sample_provider.dart';
import 'package:plant_app/ui/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ChangeText()),
        ChangeNotifierProvider(create: (ctx)=> FavoriteProvider()),
        ChangeNotifierProvider(create: (ctx)=> ProductProvider()),
      ],
      child: const MaterialApp(
        title: 'Plant App',
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
    );
  }
}
