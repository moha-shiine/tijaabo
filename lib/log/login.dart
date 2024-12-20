import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tijaabo/SERVICE/API.DART';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    final result = await _authService.registerUser(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );

    setState(() {
      _isLoading = false;
      _message = result['success'] ?? result['error'];
    });
  }

  final _fromgolbol = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromgolbol,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  scale: 0.1,
                  fit: BoxFit.contain,
                  image: AssetImage(
                    "assets/back.jpeg",
                  ))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(100),
              Image.asset(
                "assets/logo.jpeg",
                scale: 1.8,
              ),
              Gap(10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Portal",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.merienda().fontFamily,
                          fontStyle: FontStyle.normal,
                          color: Colors.green),
                    )
                  ],
                  text: "Student ",
                  style: GoogleFonts.merienda(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Gap(56),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20),
                        const Center(
                          child: Text(
                            "SING IN",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Gap(20),
                        TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your ID';
                            }
                            if (value.length < 6) {
                              return ' must be at least 6 characters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "User Name",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 0.6),
                                  borderRadius: BorderRadius.circular(8)),
                              // fillColor: Colors.blue.withOpacity(0.1),

                              /// filled: true,
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.6),
                              ),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey, width: 0.6),
                                  borderRadius: BorderRadius.circular(4))),
                        ),
                        Gap(10),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "password",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.6),
                                  borderRadius: BorderRadius.circular(8)),
                              fillColor: Colors.blue.withOpacity(0.1),
                              // filled: true,
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.6),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.6),
                                  borderRadius: BorderRadius.circular(4))),
                        ),
                        Gap(30),
                        _isLoading
                            ? CircularProgressIndicator()
                            : Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                    onPressed: () {
                                      if (_fromgolbol.currentState!
                                          .validate()) {
                                        _register();
                                        print(_register);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => MainPage()));
                                        print(
                                            'Form is valid, proceed with login');
                                      }
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )),
                              ),
                        Gap(8),
                        TextButton.icon(
                          onPressed: () {},
                          label: Text(
                            "Forget Passowrd ?",
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                          icon: Icon(
                            IconlyLight.lock,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        if (_message != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              _message!,
                              style: TextStyle(
                                color: _message!.contains("success")
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        Gap(13),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
