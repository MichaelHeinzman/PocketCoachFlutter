import 'package:flutter/material.dart';
import 'package:pocket_coach/app/pages/home.dart';
import 'package:pocket_coach/app/sign_in/sign_in_page.dart';
import 'package:pocket_coach/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return Provider<User>.value(
              value: user,
              child: Home(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
