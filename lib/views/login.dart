import 'package:basic_loyalty/controllers/auth_services.dart';
import 'package:flutter/material.dart';
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
  var _isLogin = true;
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
        _isLogin = true;
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login Successful')));
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _isLogin = false;
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
    Size size = MediaQuery.of(context).size;
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
                    const Icon(
                      Icons.loyalty_rounded,
                      size: 100,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Hello Again!',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 52,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Welcome back, you\'ve been missed!',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 50),

                    // email TextFormField
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                          ),
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (value) {
                          //   if (!isValidEmail(value)) {
                          //     return 'Please input valid email';
                          //   }
                          //   return null;
                          // },
                          // onSaved: (value) {
                          //   enteredEmail = value!;
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            controller: passController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                            ),
                            validator: (value) {
                              if (!isValidPassword(value)) {
                                return 'Please enter valid password';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              enteredPassword = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          onPressed: () {
                            //submit();
                          },
                          child: Text(
                            _isLogin ? 'Login' : 'Sign-Up',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
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
