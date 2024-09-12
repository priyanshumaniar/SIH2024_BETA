import "../utils/route_constants.dart";
import "../widgets/aju_baju_button.dart";
import "../widgets/aju_baju_input_field.dart";
import "package:email_validator/email_validator.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/foundation.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "../main.dart";

class LoginScreen extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginScreen({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 100),
          Image.asset(
            "assets/images/Logo.png",
            height: 62.0,
            width: 54.0,
          ),
          const SizedBox(height: 38),
          TextButton(
            onPressed: () {},
            child: const Text('Log In',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: "Gordita",
                    fontWeight: FontWeight.w500,
                    fontSize: 22.0,
                    fontStyle: FontStyle.normal)),
          ),
          const SizedBox(height: 33),
          AjuBajuInputField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
              imageAddress: "assets/images/IconEmail.png",
              textHint: 'Email'),
          const SizedBox(height: 16),
          AjuBajuInputField(
              controller: passwordController,
              imageAddress: "assets/images/Lock.png",
              textHint: 'Password'),
          const SizedBox(height: 18.0),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF000000),
                          fontFamily: "Gordita",
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal))),
            ),
          ),
          const SizedBox(height: 17.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 85),
              child: AjuBajuButton(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          const Center(child: CircularProgressIndicator()));
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                  } on FirebaseAuthException catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                  navigatorKey.currentState!.pushNamed(homeRoute);
                },
                buttonName: 'Log In',
              )),
          const SizedBox(height: 55.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 1.0,
                  width: 88.74,
                  color: const Color(0xff2e2499).withOpacity(0.6)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Or',
                  style: TextStyle(
                      color: const Color(0xff2e2499).withOpacity(0.6),
                      fontFamily: "Gordita",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      fontStyle: FontStyle.normal),
                ),
              ),
              Container(
                  height: 1.0,
                  width: 88.74,
                  color: const Color(0xff2e2499).withOpacity(0.6)),
            ],
          ),
          const SizedBox(height: 43.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 71.0,
                  width: 71.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.white),
                  child: Image.asset(
                    "assets/images/Facebook.png",
                    scale: 3,
                  )),
              Container(
                  height: 71.0,
                  width: 71.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.white),
                  child: Image.asset(
                    "assets/images/Google.png",
                    scale: 3,
                  )),
            ],
          ),
          const SizedBox(height: 55.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RichText(
                text: TextSpan(
                    text: 'Dont have account',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14.0,
                        fontFamily: "Gordita",
                        fontWeight: FontWeight.w400),
                    children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                    text: 'Sign Up',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: "Gordita",
                        fontWeight: FontWeight.w500),
                  )
                ]))
          ])
        ],
      ),
    )));
  }
}
