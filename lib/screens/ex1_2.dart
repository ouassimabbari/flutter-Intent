import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// ignore: camel_case_types
class Ex1_2 extends StatefulWidget {
  Ex1_2({Key key}) : super(key: key);

  @override
  _Ex1_2State createState() => _Ex1_2State();
}

// ignore: camel_case_types
class _Ex1_2State extends State<Ex1_2> {
  String intArt = "Intelligence artificielle";
  String resInf = "Réseaux informatiques";
  String devWeb = "Développement web";
  String admSys = "Administration systemes";
  String admBd = "Administration de base de données";
  String selectedString;
  @override
  void initState() {
    super.initState();
    selectedString = intArt;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ex1_2"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          CheckboxListTile(
            title: Text(intArt),
            onChanged: (bool value) {
              setState(() {
                if (value) {
                  selectedString = intArt;
                } else {
                  selectedString = null;
                }
              });
            },
            value: selectedString == intArt,
          ),
          CheckboxListTile(
            title: Text(resInf),
            onChanged: (bool value) {
              setState(() {
                if (value) {
                  selectedString = resInf;
                } else {
                  selectedString = null;
                }
              });
            },
            value: selectedString == resInf,
          ),
          CheckboxListTile(
            title: Text(devWeb),
            onChanged: (bool value) {
              setState(() {
                if (value) {
                  selectedString = devWeb;
                } else {
                  selectedString = null;
                }
              });
            },
            value: selectedString == devWeb,
          ),
          CheckboxListTile(
            title: Text(admSys),
            onChanged: (bool value) {
              setState(() {
                if (value) {
                  selectedString = admSys;
                } else {
                  selectedString = null;
                }
              });
            },
            value: selectedString == admSys,
          ),
          CheckboxListTile(
            title: Text(admBd),
            onChanged: (bool value) {
              setState(() {
                if (value) {
                  selectedString = admBd;
                } else {
                  selectedString = null;
                }
              });
            },
            value: selectedString == admBd,
          ),
          Container(
            margin: EdgeInsets.only(top: deviceHeight / 4),
            child: RaisedButton(
              child: Text("Afficher"),
              onPressed: () => Toast.show(selectedString, context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM),
            ),
          )
        ],
      ),
    );
  }
}
