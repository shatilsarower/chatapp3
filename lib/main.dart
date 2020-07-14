import 'package:flutter/material.dart';

import 'file:///home/shatil/AndroidStudioProjects/chatapp/screens/chat_screen.dart';
import 'file:///home/shatil/AndroidStudioProjects/chatapp/screens/login_screen.dart';
import 'file:///home/shatil/AndroidStudioProjects/chatapp/screens/registration_screen.dart';
import 'file:///home/shatil/AndroidStudioProjects/chatapp/screens/welcome_screen.dart';

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
