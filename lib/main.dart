import 'package:chatapp/Screens/chat_screen.dart';
import 'package:chatapp/Screens/login_screen.dart';
import 'package:chatapp/Screens/registration_screen.dart';
import 'package:chatapp/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/chat_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/registration_screen.dart';
import 'Screens/welcome_screen.dart';

void main() => runApp(Chatapp());

class Chatapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
