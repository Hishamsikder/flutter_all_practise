
import 'package:flutter/material.dart';
import 'package:untitled6/api_services.dart';
import 'package:untitled6/model.dart';
import 'package:untitled6/second_page.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  TextEditingController emaildata= TextEditingController();
  TextEditingController passworddata= TextEditingController();
  TextEditingController secondPageData= TextEditingController();
  Postmodel postmodel =Postmodel();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: [
              const Padding(
                padding: EdgeInsets.all(8.0),
              )
            ],
            title: const Text("single data"),
            backgroundColor: Colors.cyanAccent,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: emaildata,
                  decoration: InputDecoration(
                      hintText: "       Enter email"
                  ),
                ),
                TextField(
                  controller: passworddata,
                  decoration: InputDecoration(
                      hintText: "       Enter Password"
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(onPressed: (){
                  ApiService().loginwithModel(emaildata.text.toString(), passworddata.text.toString()).then((value) {
                    setState(() {
                      postmodel = value!;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage(
                        token : postmodel.token.toString(),secondPage: secondPageData.text,
                      )));
                    });
                  }).onError((error, stackTrace) {
                    print(error);
                  });
                }, child: Text("Login")),
                TextField(
                  controller: secondPageData,
                  decoration: InputDecoration(
                      hintText: "  Enter Second page data"
                  ),
                )
              ],
            ),
          )),
    );
  }
}
