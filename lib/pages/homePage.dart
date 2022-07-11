import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_starter/pages/postData.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({ Key? key }) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late String dataBody, name, id;
  
  @override
  void initState() {
    dataBody = "No data";
    id = "";
    name = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Get"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:EdgeInsets.all(5),),
              Text(dataBody),
              Text(id),
              Text(name),
            ElevatedButton(
              onPressed: () async {
                var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
                if (response.statusCode==200) {
                  var data = json.decode(response.body) as Map<String, dynamic>;
                  print("Data retrieved");
                  setState(() {
                    dataBody = "";
                    id = data['data']['id'].toString();
                    name = "${data['data']['first_name']} ${data['data']['last_name']}";
                  });
                }
                else dataBody="Data retrieveing is failed";
              }, 
              child: Text("Get Data")),
            ElevatedButton(
              child: Text("Post"),
              onPressed: () {
              Navigator.pushNamed(context, '/postData');
            }), 
          ],
        ),
      ),
    );
  }
}