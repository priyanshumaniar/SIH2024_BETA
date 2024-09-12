import "../utils/route_constants.dart";
import "../widgets/aju_baju_button.dart";
import "package:email_validator/email_validator.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/foundation.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "../main.dart";
import "../widgets/aju_baju_input_field.dart";

class SignUpScreen extends StatefulWidget {
  final VoidCallback onClickedLogIn;

  const SignUpScreen({
    Key? key,
    required this.onClickedLogIn,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey();

  bool tnc = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Form(
          key: formkey,
          child: Center(
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
                  child: const Text('Sign Up',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: "Gordita",
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0,
                          fontStyle: FontStyle.normal)),
                ),
                const SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: Container(
                            height: 45.0,
                            width: 48.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xFFF67952).withOpacity(0.1),
                            ),
                            child: Image.asset(
                              "assets/images/Profile.png",
                              scale: 3,
                            )),
                      ),
                      hintText: "Name",
                    ),
                  ),
                ),
                const SizedBox(height: 10.5),
                AjuBajuInputField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                    imageAddress: "assets/images/IconEmail.png",
                    textHint: 'Email'),
                const SizedBox(height: 11),
                AjuBajuInputField(
                    controller: passwordController,
                    imageAddress: 'assets/images/Lock.png',
                    textHint: 'Password'),
                const SizedBox(height: 17.0),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      activeColor: const Color(0xFFF67952),
                      onChanged: (val) {},
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'I accept all the',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: "Gordita",
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                fontStyle: FontStyle.normal),
                            children: const <TextSpan>[
                          TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Gordita",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.normal))
                        ]))
                  ],
                ),
                const SizedBox(height: 17.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 85),
                    child: AjuBajuButton(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) => const Center(
                                child: CircularProgressIndicator()));
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                        } on FirebaseAuthException catch (e) {
                          if (kDebugMode) {
                            print(e);
                          }
                        }
                        navigatorKey.currentState!
                            .popUntil((route) => route.isFirst);
                      },
                      buttonName: "Sign Up",
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
                          text: 'Already have an account? ',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14.0,
                              fontFamily: "Gordita",
                              fontWeight: FontWeight.w400),
                          children: [
                        // TextSpan(
                        //   recognizer: TapGestureRecognizer()
                        //     ..onTap = () {
                        //       Navigator.pop(context);
                        //     },
                        //   text: 'Log In.',
                        //   style: const TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 14.0,
                        //       fontFamily: "Gordita",
                        //       fontWeight: FontWeight.w500),
                        // )
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, loginRoute);
                            },
                          text: 'Log In',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: "Gordita",
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ]))
                ])
              ],
            ),
          )),
        ));
  }
}
