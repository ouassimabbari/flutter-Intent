import 'package:flutter/material.dart';
import 'package:intent/action.dart' as Action;
import 'package:intent/intent.dart' as Intent;
import 'package:map_launcher/map_launcher.dart';

class Ex2 extends StatefulWidget {
  Ex2({Key key}) : super(key: key);

  @override
  _Ex2State createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  static const String nav = "Ouvrir le navigateur";
  static const String app = "Appeler quelqu'un";
  static const String comp = "Composer un numero";
  static const String map = "Afficher la map";
  static const String mapSearch = "Chercher dans la map";
  static const String photo = "Prendre une photo";
  static const String contacts = "Afficher les contacts";
  static const String modPremierContact = "Modifier le premier contact";
  String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = nav;
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ex2"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  nav,
                  app,
                  comp,
                  map,
                  mapSearch,
                  photo,
                  contacts,
                  modPremierContact
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: deviceHeight / 3,
              ),
              RaisedButton(
                onPressed: () async {
                  switch (dropdownValue) {
                    case nav:
                      Intent.Intent()
                          .setAction(Action.Action.ACTION_VIEW)
                          .setData(Uri(scheme: "https", host: "google.com"))
                          .startActivity()
                          .catchError((e) => print(e));
                      break;
                    case app:
                      Intent.Intent()
                        ..setAction(Action.Action.ACTION_CALL)
                        ..setData(Uri(scheme: 'tel', path: '121'))
                        ..startActivity().catchError((e) => print(e));
                      break;
                    case comp:
                      Intent.Intent()
                        ..setAction(Action.Action.ACTION_DIAL)
                        ..setData(Uri(scheme: 'tel', path: '121'))
                        ..startActivity().catchError((e) => print(e));
                      break;
                    case map:
                      if (await MapLauncher.isMapAvailable(MapType.google)) {
                        await MapLauncher.showMarker(
                          mapType: MapType.google,
                          coords: Coords(37.759392, -122.5107336),
                          title: "title",
                          description: "description",
                        );
                      }
                      break;
                    case mapSearch:
                      if (await MapLauncher.isMapAvailable(MapType.google)) {
                        await MapLauncher.showMarker(
                          mapType: MapType.google,
                          coords: Coords(37.759392, -122.5107336),
                          title: "title",
                          description: "description",
                        );
                      }
                      break;
                    case photo:
                      Intent.Intent()
                        ..setAction(Action.Action.ACTION_IMAGE_CAPTURE)
                        ..startActivityForResult().then(
                            (data) => print(
                                data[0]), // gets you path to image captured
                            onError: (e) => print(e));
                      break;
                    case contacts:
                      Intent.Intent()
                        ..setAction(Action.Action.ACTION_PICK)
                        ..setData(Uri.parse('content://contacts'))
                        ..setType("vnd.android.cursor.dir/phone_v2")
                        ..startActivityForResult().then((data) => print(data),
                            onError: (e) => print(e));
                      break;
                    case modPremierContact:
                      Intent.Intent()
                        ..setAction(
                            'com.android.contacts.action.SHOW_OR_CREATE_CONTACT')
                        ..setData(Uri(scheme: 'tel', path: '1234567890'))
                        ..startActivity().catchError((e) => print(e));
                      break;
                    default:
                  }
                },
                child: Container(
                  child: Text(
                    "Executer",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
