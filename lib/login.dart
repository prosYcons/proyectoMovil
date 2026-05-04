import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/utils/constants.dart' as con;
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showpwd = true;

  final user = TextEditingController();
  final pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.colorBack,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              //logo-PONER LA IMAGEN EN VEZ DE ESTO, ESTO SOLO ES UN PLACEHOLDER MIENTRAS NO LA TENGO JAJAJAJ----------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 70,
                  ),
                ],
              ),

              SizedBox(height: 30),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: con.colorCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Master algorithms with precision.",
                      style: TextStyle(color: Colors.white),
                    ),

                    SizedBox(height: 10),

                    buildInput("Email Address", false, user),
                    SizedBox(height: 15),
                    buildInput("Password", true, pwd),

                    SizedBox(height: 10),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: con.colorBot),
                      ),
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Home(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.colorBot,
                        minimumSize: Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Login"),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "OR CONNECT WITH",
                      style: TextStyle(color: Colors.white),
                    ),

                    SizedBox(height: 15),

                    //GOOGLE THINGY----------------------------------------------------------------------
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata, color: Colors.white),
                      label: Text(
                        "Log in with Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 45),
                        side: BorderSide(color: Colors.white24),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to AlgoLearn?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Register(),
                        ),
                      );
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(String hint, bool isPassword, controller) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? showpwd : false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: con.colorBox,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          isPassword ? Icons.lock : Icons.email,
          color: Colors.white70,
        ),
        suffixIcon: isPassword
            ? IconButton(
              icon: Icon(
                showpwd ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: () {
                setState(() {
                  showpwd = !showpwd;
                });
              },
            )
            : null,
      ),
    );
  }
}
