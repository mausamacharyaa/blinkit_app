import 'package:blinkit_clone/ui_helper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [UiHelper.CustomImage(img: "unnamed.jpg"),
            SizedBox(height: 10,),
            UiHelper.CustomImage(img: "unnamed(1).jpg")]
          ),
        ),
      ),
    );
  }
}

//19:20