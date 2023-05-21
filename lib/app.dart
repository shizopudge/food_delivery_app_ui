import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/pages/start_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Roboto',
            ),
      ),
      home: const StartPage(),
    );
  }
}
