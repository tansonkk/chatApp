import 'dart:io';
import 'package:chatapp/Screens/home_screen.dart';
import 'package:chatapp/api/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../helper/dialogs.dart';
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
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        setState(() {
          _isAnimate = true;
        });
      },
    );
  }

//handle google login button
  _handleGoogleBtnClick() {
    //showing progress bar
    Dialogs.showProgressBar(context);
    //hiding progress bar
    _signInWithGoogle().then(
      (user) async {
        Navigator.pop(context);
        if (user != null) {
          print('user: ${user.user}');
          print('user Info: ${user.additionalUserInfo}');
          if ((await APIs.userExists())) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            );
          } else {
            await APIs.createUser().then((then) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            });
          }
        }
      },
    );
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      print('_signInWithGoogle: $e');
      Dialogs.showSnackBar(context, 'Something wrong (check internet!)');
      return null;
    }
  }

  //sign out
  // _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   await GoogleSignIn().signOut();
  // }

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
                _handleGoogleBtnClick();
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
