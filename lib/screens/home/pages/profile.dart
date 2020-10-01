import 'package:Barkod724/settingspage/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:Barkod724/models/user.dart';
import 'package:Barkod724/shared/loading.dart';
import 'package:Barkod724/shared/constants.dart';
import 'package:Barkod724/services/database.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> cardCredits = [
    '0',
    '100',
    '250',
    '500',
    '1000',
    '3000',
    '5000'
  ];

  final List<String> cardLimits = [
    '0',
    '100',
    '200',
    '300',
    '400',
    '500',
    '600',
    '700',
    '800',
    '900',
    '1000',
  ];

  //form values
  String _currentName;
  int _currentCredits;
  String _currentCardNum;
  int _currentLimit;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    void _showSettingsPanel() {
      showDialog(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsPage(),
          );
        },
      );
    }

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: new Text(''),
            backgroundColor: Colors.blue,
            centerTitle: true,
            elevation: 35,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new HomePage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                  Navigator.of(context).pushNamed('/services');
                },
              ),
              IconButton(
                icon: Icon(Icons.phone),
                onPressed: () {
                  Navigator.of(context).pushNamed('/contact');
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: StreamBuilder<UserData>(
              stream: DatabaseService(uid: user.uid).userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UserData userData = snapshot.data;
                  return Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: Text(
                              'Update your user settings',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Card Holder:",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          TextFormField(
                            initialValue: userData.name,
                            decoration: textInputDecoration,
                            validator: (val) =>
                                val.isEmpty ? 'Update your name' : null,
                            onChanged: (val) =>
                                setState(() => _currentName = val),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Card Number:",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          TextFormField(
                            initialValue: userData.cardNum,
                            decoration: textInputDecoration,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter your name' : null,
                            onChanged: (val) =>
                                setState(() => _currentCardNum = val),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          //dropdown
                          Text("Credits:", style: TextStyle(fontSize: 20.0)),

                          DropdownButtonFormField(
                            decoration: textInputDecoration,
                            value: _currentCredits ?? userData.availableCredits,
                            items: cardCredits.map((availableCredits) {
                              return DropdownMenuItem(
                                value: availableCredits,
                                child: Text('$availableCredits TRY'),
                              );
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => _currentCredits = val),
                          ),
                          //slider
                          SizedBox(
                            height: 20.0,
                          ),
                          Text("Card Limit:", style: TextStyle(fontSize: 20.0)),

                          DropdownButtonFormField(
                            decoration: textInputDecoration,
                            value: _currentLimit ?? userData.cardLimits,
                            items: cardLimits.map((cardLimits) {
                              return DropdownMenuItem(
                                value: cardLimits,
                                child: Text('$cardLimits TRY'),
                              );
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => _currentLimit = val),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            child: RaisedButton(
                                color: Colors.amber,
                                elevation: 7.0,
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    await DatabaseService(uid: user.uid)
                                        .updateUserData(
                                            _currentCardNum ?? userData.cardNum,
                                            _currentName ?? userData.name,
                                            _currentCredits ??
                                                userData.availableCredits,
                                            _currentLimit ??
                                                userData.cardLimits);
                                    Navigator.pop(context);
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Loading();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
