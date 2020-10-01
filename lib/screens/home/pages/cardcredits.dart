import 'package:Barkod724/models/user.dart';
import 'package:Barkod724/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:Barkod724/screens/home/barcodelist.dart';
import 'package:provider/provider.dart';
import 'package:Barkod724/services/database.dart';
import 'package:Barkod724/models/barcode.dart';

//Pages
import 'package:Barkod724/settingspage/settings_page.dart';

class CardCredits extends StatefulWidget {
  @override
  _CardCreditsState createState() => _CardCreditsState();
}

class _CardCreditsState extends State<CardCredits> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsPage(),
            );
          });
    }

    return StreamProvider<List<Barcode>>.value(
      value: DatabaseService().barcodes,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(''),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 35,
          actions: <Widget>[
            Center(
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new HomePage()));
                },
              ),
            ),
            Center(
              child: IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                  Navigator.of(context).pushNamed('/services');
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                Navigator.of(context).pushNamed('/contact');
              },
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(''),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),

        //Starts here

        body: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              return Form(
                key: _formKey,
                child: Container(
                  child: BarCodeList(),
                ),
              );
            }),
      ),
    );
  }
}
