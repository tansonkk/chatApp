import 'package:chatapp/Screens/home_screen.dart';

import '../../main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Animated setting
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();
    //Animated setting
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome!"),
      ),
      body: Stack(
        children: [
          //app logo
          //Animated setting
          AnimatedPositioned(
            top: mq.height * .15,
            //Animated setting
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            width: mq.width * .5,
            duration: const Duration(seconds: 1),
            child: Image.asset('images/climbing.png'),
          ),
          //google login
          Positioned(
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .07,
            bottom: mq.height * .15,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 223, 255, 187),
                shape: StadiumBorder(),
                elevation: 1,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              icon: Image.asset('images/google.png'),
              label: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 19),
                  children: [
                    TextSpan(text: "Google Sign In"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
