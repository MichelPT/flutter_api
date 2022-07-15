import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({ Key? key }) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login",
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )),

          SizedBox(height: 15),
          
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)) )
            ),
          ),

          SizedBox(height: 15),
          
         TextField(
          controller: _passwordController,
          obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)) )
            ),
          ),

          SizedBox(height: 15),

          Container(
                   width: MediaQuery.of(context).size.width / 1.5,
                   child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size.fromWidth(300)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(20),
                        )
                      )
                    ),
                    onPressed:() async {
                      try {
                        await firebaseAuth.signInWithEmailAndPassword(
                      email: _emailController.text, 
                      password: _passwordController.text
                      ).then((value) => Navigator.popAndPushNamed(context, '/homePage'));
                      } catch (e) {
                      }
                      String text = "";
                      if (_emailController.text.isEmpty||_passwordController.text.isEmpty) {
                        text = "Please input your email or password";
                      } else {text = "Incorrect email or password";}
                      SnackBar snackBar = SnackBar(
                        content: Text(text));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Login'),
                  ),  
                 ),
                 
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       child: Text('Tidak punya akun?'),
                     ),
                     TextButton(
                       onPressed: (){
                         Navigator.pushNamed(context, '/registerScreen');
                       },
                       child: Text('Daftar disini.'),
                     )
                   ],
                 )
        ],
      ),
    );
  }
}