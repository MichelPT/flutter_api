import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class postData extends StatefulWidget {
  const postData({ Key? key }) : super(key: key);

  @override
  State<postData> createState() => _postDataState();
}

class _postDataState extends State<postData> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late String result;

  @override
  void initState() {
    result = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP Post")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "Email"
            ),
          ),

          SizedBox(height: 10),

          TextField(
            controller: passController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "Password"
            ),
          ),

          SizedBox(height: 10),

          ElevatedButton(onPressed:() async {
            var response = await http.post(Uri.parse("https://reqres.in/api/register"),
            body : {"email" : emailController.text, "password" : passController});
            var data = json.decode(response.body) as Map<String, dynamic>;
            setState(() {
              result = "Email :${data["email"]} - - - - - Password ::${data["password"]}";
            });
          }, 
          child: Text("Post")),

          SizedBox(height: 10),

          Text(result)       
        ],
      ),
    );
  }
}