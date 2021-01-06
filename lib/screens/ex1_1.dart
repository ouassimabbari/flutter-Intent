import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// ignore: camel_case_types
class Ex1_1 extends StatefulWidget {
  Ex1_1({Key key}) : super(key: key);

  @override
  _Ex1_1State createState() => _Ex1_1State();
}

// ignore: camel_case_types
class _Ex1_1State extends State<Ex1_1> {
  String _character = "homme";
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ex1_1"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: RadioListTile<String>(
              title: const Text('Homme'),
              value: "Homme",
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: RadioListTile<String>(
              title: const Text('Femme'),
              value: "Femme",
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: deviceHeight / 4),
            child: RaisedButton(
              child: Text("Afficher"),
              onPressed: () => Toast.show(_character, context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM),
            ),
          )
        ],
      ),
    );
  }
}
