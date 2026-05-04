import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/login.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showpwd = true;
  bool acceptTerms = false;

  final name = TextEditingController();
  final email = TextEditingController();
  final pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:con.colorBack,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              //LOGO-------CAMBIAR POR IMAGE-----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 45,
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: con.colorCont,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Text(
                      "Master Algorithms",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Create an account to track your journey",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),

                    SizedBox(height: 20),

                    buildInput("Full Name", false, name),
                    SizedBox(height: 12),
                    buildInput("Email Address", false, email),
                    SizedBox(height: 12),
                    buildInput("Password", true, pwd),

                    SizedBox(height: 15),

                    //terminos checkbox cosa
                    Row(
                      children: [
                        Checkbox(
                          value: acceptTerms,
                          activeColor: con.brightGreen,
                          onChanged: (value) {
                            setState(() {
                              acceptTerms = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(color: con.colorBot),
                                ),
                                TextSpan(text: " and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(color: con.colorBot),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    //boton wuuuu
                    ElevatedButton(
                      onPressed: acceptTerms ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Home(),
                          ),
                        );
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.colorBot,
                        minimumSize: Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create Account"),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.white)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR CONNECT WITH",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.white)),
                      ],
                    ),

                    SizedBox(height: 15),

                    //google
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata,
                        color: Colors.white, size: 28),
                      label: Text(
                        "Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 45),
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //regresar a login por si las dudas jja
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Login(),
                        ),
                      );
                    },
                    child: Text("Login"),
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
          isPassword ? Icons.lock : Icons.person,
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
        ) : null,
      ),
    );
  }
}
