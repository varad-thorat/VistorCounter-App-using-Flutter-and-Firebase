import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_app/display.dart';
import 'package:login_signup_app/form_screen.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final userController = TextEditingController();
  final _confirmPass = TextEditingController();
  bool passToggle = true;
  bool passToggle1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("SignUp Page"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Form(
              key: _formfield,
              child: Column(children: [
                // Image.asset(
                //   "images/icon.png",
                //   height: 200,
                //   width: 200,
                // ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  controller: userController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                    ),
                    prefixIcon: Icon(Icons.verified_user,
                        color: FocusScope.of(context).isFirstFocus
                            ? Colors.white
                            : Colors.yellow),
                    errorStyle: TextStyle(color: Colors.yellow),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                    ),
                    prefixIcon: Icon(Icons.email,
                        color: FocusScope.of(context).isFirstFocus
                            ? Colors.white
                            : Colors.yellow),
                    errorStyle: TextStyle(color: Colors.yellow),
                  ),
                  validator: (value) {
                    bool emailValid =
                        RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                            .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter email";
                    } else if (!emailValid) {
                      return "Enter Valid Email";
                    }
                  },
                ),
                SizedBox(height: 20), //gap between the two box
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.lock,
                          color: FocusScope.of(context).isFirstFocus
                              ? Colors.white
                              : Colors.yellow),
                      errorStyle: TextStyle(color: Colors.yellow),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    } else if (passController.text.length < 8) {
                      return "Password length should not be less than 8 characters";
                    }
                    bool passValid =
                        RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                            .hasMatch(value);
                    if (!passValid) {
                      return "Enter atleast one capital,one small letter and a number";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _confirmPass,
                  obscureText: passToggle1,
                  validator: (val) {
                    if (val!.isEmpty) return 'Empty';
                    if (val != passController.text) return 'Not Match';
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                    ),
                    prefixIcon: Icon(Icons.lock,
                        color: FocusScope.of(context).isFirstFocus
                            ? Colors.white
                            : Colors.yellow),
                    errorStyle: TextStyle(color: Colors.yellow),
                  ),
                ),
                SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text)
                        .then((value) {
                      print("Created New account");
                      if (_formfield.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CounterDisplay()),
                        );
                        // Clear the form fields
                        emailController.clear();
                        passController.clear();
                        _confirmPass.clear();
                        userController.clear();
                      }
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
