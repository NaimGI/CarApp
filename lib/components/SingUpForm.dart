import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../Service/auth.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm();

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var namecontroller = TextEditingController();
  bool changed = false;
  bool _isLoading = false;

  void _handleSignUp(String email, String pass, String name, context) async {
    // Set the isLoading flag to true to start the loading indicator
    showLoadingIndicator(context);

    try {
      await AuthService.signUp(email, pass, name, context);
    } catch (e) {
      // Handle sign-up error, e.g. show error message
      showErrorDialog(context, 'Sign up error', e.toString());
    } finally {
      // Set the isLoading flag to false to stop the loading indicator
    }
  }

  Future<dynamic> showLoadingIndicator(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: SpinKitThreeInOut(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }

  void _handleLogin(
    String email,
    String pass,
  ) async {
    // Set the isLoading flag to true to start the loading indicator
    showLoadingIndicator(context);
    try {
      await AuthService.signIn(context, email, pass);
    } catch (e) {
      // Handle sign-up error, e.g. show error message
      showErrorDialog(context, 'Sign up error', e.toString());
    } finally {
      // Set the isLoading flag to false to stop the loading indicator
    }
  }

  void showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: changed
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create an account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    _TextField(
                      label: 'الاسم',
                      icon: Icons.person,
                      validator: (value) =>
                          value!.isEmpty ? 'ادخل الاسم' : null,
                      controller: namecontroller,
                      onsaved: (value) {
                        namecontroller.text = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    _TextField(
                      label: 'البريد الإلكتروني',
                      icon: Icons.email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "لا يمكن ترك حقل البريد الإلكتروني فارغًا";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("يرجى إدخال عنوان بريد إلكتروني صحيح");
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      onsaved: (value) {
                        namecontroller.text = value!;
                      },
                    ),
                    const SizedBox(height: 17),
                    _TextField(
                      label: 'كلمة المرور',
                      icon: Icons.lock,
                      hidden: true,
                      validator: (value) =>
                          value!.isEmpty ? 'ادخل كلمة المرور' : null,
                      controller: passController,
                      onsaved: (value) {
                        namecontroller.text = value!;
                      },
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _handleSignUp(
                              emailController.text,
                              passController.text,
                              namecontroller.text,
                              context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [0.4, 0.8],
                            colors: [
                              Color.fromRGBO(42, 37, 92, 1),
                              Color.fromRGBO(182, 64, 116, 1)
                            ],
                          ),
                        ),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          child: Center(child: Text("Create a account")),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    GestureDetector(
                      onTap: () {
                        // handle button click here
                        setState(() {
                          changed = !changed;
                        });
                      },
                      child: Text(
                        "Already have an account? Sign in.",
                        style: TextStyle(
                            fontSize: 20, color: Colors.blueGrey.shade300),
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      "Login to your account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const SizedBox(height: 10),
                    _TextField(
                      label: 'عنوان البريد الإلكتروني',
                      icon: Icons.email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "يجب إدخال عنوان البريد الإلكتروني";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("الرجاء إدخال عنوان بريد إلكتروني صالح");
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      onsaved: (value) {
                        namecontroller.text = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    _TextField(
                      label: 'كلمة المرور',
                      icon: Icons.lock,
                      hidden: true,
                      validator: (value) =>
                          value!.isEmpty ? 'يجب إدخال كلمة المرور' : null,
                      controller: passController,
                      onsaved: (value) {
                        namecontroller.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _handleLogin(
                              emailController.text, passController.text);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [0.4, 0.8],
                            colors: [
                              Color.fromRGBO(42, 37, 92, 1),
                              Color.fromRGBO(182, 64, 116, 1)
                            ],
                          ),
                        ),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          child: Center(child: Text("Login")),
                        ),
                      ),
                    ),
                    const SizedBox(height: 90),
                    GestureDetector(
                      onTap: () {
                        // handle button click here
                        setState(() {
                          changed = !changed;
                        });
                      },
                      child: Text(
                        "Sign Up.",
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    )
                  ],
                ),
        )));
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool hidden;
  final Function(String?)? onsaved;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  _TextField({
    Key? key,
    required this.label,
    required this.icon,
    this.hidden = false,
    this.controller,
    this.onsaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // added
        children: [
          Icon(
            icon,
            color: Colors.grey.shade400,
          ),
          SizedBox(width: 16), // added
          Expanded(
            child: TextFormField(
              validator: validator,
              controller: controller,
              onSaved: onsaved,
              cursorColor: Colors.pink.shade400,
              obscureText: hidden,
              autocorrect: !hidden,
              enableSuggestions: !hidden,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 18,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink.shade400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextFieldCreated extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool hidden;

  _TextFieldCreated({
    Key? key,
    required this.label,
    required this.icon,
    this.hidden = false,
  }) : super(key: key);

  @override
  State<_TextFieldCreated> createState() => _TextFieldCreatedState();
}

class _TextFieldCreatedState extends State<_TextFieldCreated> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              cursorColor: Colors.pink.shade400,
              obscureText: widget.hidden,
              autocorrect: !widget.hidden,
              enableSuggestions: !widget.hidden,
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 18,
                ),
                suffixIcon: Icon(
                  widget.icon,
                  color: Colors.grey.shade400,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink.shade400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
