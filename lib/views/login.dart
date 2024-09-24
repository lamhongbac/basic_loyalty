import 'package:basic_loyalty/components/rounded_button.dart';
import 'package:basic_loyalty/components/rounded_text_form_field.dart';
import 'package:basic_loyalty/components/text_form_field_container.dart';
import 'package:basic_loyalty/controllers/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  var enteredEmail = '';
  var enteredPassword = '';
  void submit() {
    final isValid = _formkey.currentState!.validate();

    //chú ý:
    //sau khi isValid thi enteremail va password dc gán giá trị
    //nếu email và password kg đáp ứng rule thì isValid=false
    // và cac message return sẽ hiển thị

    if (isValid) {
      _formkey.currentState!.save();
    }

    AuthService.loginWithEmail(emailController.text, passController.text)
        .then((value) {
      if (value == 'LoginSuccessful') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login Successful')));
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Login failed ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
    });
  }

  ///
  /// email must contain @
  ///
  bool isValidEmail(String? email) {
    bool isValid = true;
    if (email == null || email.isEmpty || !email.contains('@')) {
      isValid = false;
    }
    return isValid;
  }

  ///
  ///password length >6
  ///
  bool isValidPassword(String? password) {
    bool isValid = true;
    if (password == null || password.isEmpty || password.length < 6) {
      isValid = false;
    }
    return isValid;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // const Icon(
                    //   Icons.loyalty_rounded,
                    //   size: 100,
                    // ),
                    SvgPicture.asset("assets/icons/login.svg"),
                    const SizedBox(height: 20),
                    
                    // email TextFormField
                    RoundedInputTextFormField(
                      icon: Icons.person,
                      hintText: "Your Email",
                      controller: emailController,
                      validator: (value) {
                        if (!isValidEmail(value)) {
                          return 'Please input valid email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        enteredEmail = value!;
                      },
                    ),

                    RoundedInputTextFormField(
                      icon: Icons.lock,
                      hintText: "Password",
                      controller: passController,
                      validator: (value) {
                        if (!isValidPassword(value)) {
                          return 'Please enter valid password';
                        }
                        else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        enteredPassword = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      text: "Login",
                      press: submit,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text('Not a member?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
