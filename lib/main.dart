import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pocket_coach/app/landing_page.dart';
import 'package:pocket_coach/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      builder: (context) => Auth(),
      child: MaterialApp(
        title: 'Pocket Coach',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
      ),
    );
  }
}
