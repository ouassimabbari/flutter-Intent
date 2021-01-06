import 'package:flutter/material.dart';
import 'package:tp_3/screens/ex1_1.dart';
import 'package:tp_3/screens/ex1_2.dart';
import 'package:tp_3/screens/ex2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP-3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (BuildContext context) {
          final deviceWidth = MediaQuery.of(context).size.width;
          final deviceHeight = MediaQuery.of(context).size.height;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("TP3"),
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                height: deviceHeight / 4,
                width: deviceWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Ouvrez la barre de navigation en cliquant sur l'icone en haut à gauche",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Exercise 1-1"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ex1_1()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Exercise 1-2"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ex1_2()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Exercise 2"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ex2()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
