import 'package:apiexam2023/getapi.dart';
import 'package:apiexam2023/postapi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    // theme: ThemeData.fallback(useMaterial3: true),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> q = ["QUE 1", "QUE 2"];
  List<String> s = ["POST API", "GET API"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("API EXAM 2023")),
      ),
      body: Container(
        color: Colors.black26,
        child: ListView.builder(
          itemCount: q.length,
          itemBuilder: (context, index) {
            return Container(
                color: Colors.black38,
                margin: EdgeInsets.all(50),
                child: ListTile(
                  onTap: () {
                    index == 0
                        ? {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return postapi();
                              },
                            ))
                          }
                        : {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return getapi();
                              },
                            ))
                          };
                  },
                  title: Center(child: Text("${q[index]}")),
                  subtitle: Center(child: Text("${s[index]}")),
                ));
          },
        ),
      ),
    );
  }
}
