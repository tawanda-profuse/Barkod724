import 'package:Barkod724/settingspage/settings_page.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class TransactionReport extends StatefulWidget {
  @override
  _TransactionReportState createState() => _TransactionReportState();
}

class _TransactionReportState extends State<TransactionReport> {
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
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Container(
                // padding: EdgeInsets.all(50.0),
                child: Center(
                  child: Text(
                    'Transaction Report',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Card Number:' + '\t\t\t\t\t\t\t\t\t\t\t\t3000789001',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Card Holder:' + '\t\t\tGIGABYTE BARKOD',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Firm Code:' +
                      '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t789',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Firm Name:' + '\t\t\t\tGIGABYTE BARKOD',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Number of printed barcodes: ' + '7308',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Number of added products: ' + '\t\t\t105',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Total Debt:' +
                      '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t220.06',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Total Credits:' +
                      '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t150.00',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Total Available Credits:' + '\t\t\t\t\t\t\t\t\t\t\t\t\t2.00',
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                width: 300.0,
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue),
                    ),
                    color: Colors.lightBlue,
                    elevation: 7.0,
                    child: Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
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
