import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'zipcodeph.dart';

void main() {
  runApp(const ZIPCodePH());
}

class ZIPCodePH extends StatelessWidget {
  const ZIPCodePH({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZIP Code PH',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: const MainScreen(),
    );
  }
}
