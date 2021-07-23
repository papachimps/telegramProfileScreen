import 'package:flutter/material.dart';

import '/constants.dart';
import '/profileScreen.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryBgColor,
        buttonColor: kButtonBlueColor,
        accentColor: kAccentColor,
      ),
      home: ProfileScreen(),
    );
  }
}
