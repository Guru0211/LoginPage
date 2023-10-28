import 'package:flutter/material.dart';
import 'package:techathon/Service/backend.dart';
import 'package:techathon/screen/login.dart';

class home_Page extends StatefulWidget {
  String useremail;

  home_Page({required this.useremail});

  @override
  State<home_Page> createState() => _home_PageState(useremail: useremail);
}

class _home_PageState extends State<home_Page> {
  String useremail;

  _home_PageState({required this.useremail});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            title: const Text("Tech-A-Thon"),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent[100],
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                  child: const Icon(
                    Icons.logout,
                    size: 26.0,

                  ),
                )
            ),
          ],
        ),
        body: FutureBuilder<String>(
          future: home_Username(useremail),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.3),
                  child: Column(
                    children: [
                      Text("Hi,",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent[100],
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "${snapshot.data}",
                        style: const TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
// Future<String> Convert_usr() async{
//   var demo=await home_Username(useremail);
//   print (demo);
//   return demo;
// }
}
