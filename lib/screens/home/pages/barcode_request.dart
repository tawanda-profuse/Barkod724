import 'package:flutter/material.dart';
import 'package:Barkod724/settingspage/settings_page.dart';

import '../home_page.dart';

class BarCodeRequest extends StatefulWidget {
  @override
  _BarCodeRequestState createState() => _BarCodeRequestState();
}

class _BarCodeRequestState extends State<BarCodeRequest> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    'Barcode Request',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                child: Center(
                  child: Text(
                    'Barcode Source:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                // padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Barcode',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                height: 60.0,
                width: 300.0,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue),
                    ),
                    color: Colors.blue,
                    elevation: 100.0,
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    onPressed: null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
