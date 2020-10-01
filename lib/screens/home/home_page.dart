import 'package:Barkod724/models/barcode.dart';
import 'package:Barkod724/models/user.dart';
import 'package:Barkod724/screens/home/pages/add_products.dart';
import 'package:Barkod724/screens/home/pages/barcode_request.dart';
import 'package:Barkod724/screens/home/pages/client/products.dart';
import 'package:Barkod724/screens/home/pages/profile.dart';
import 'package:Barkod724/screens/home/pages/transaction_report.dart';
import 'package:Barkod724/services/auth.dart';
import 'package:Barkod724/services/database.dart';
import 'package:flutter/material.dart';
import 'package:Barkod724/screens/home/pages/cardcredits.dart';

//Pages
import 'package:Barkod724/about.dart';
import 'package:Barkod724/contact_us.dart';
import 'package:Barkod724/settingspage/settings_page.dart';
import 'package:Barkod724/services_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
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

    var userAccountsDrawerHeader = new UserAccountsDrawerHeader(
      accountName: new Text(
        'Barkod 724',
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      accountEmail: new Text('0000 0000 0000 0000'),
    );
    return StreamProvider<List<Barcode>>.value(
      value: DatabaseService().barcodes,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(''),
          backgroundColor: Colors.blue,
          centerTitle: false,
          elevation: 35,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () {
                Navigator.of(context).pushNamed('/admin');
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
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              userAccountsDrawerHeader,
              new ListTile(
                title: new Text(
                  'Home',
                  style: TextStyle(fontSize: 40.0),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new HomePage()));
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              new ListTile(
                title: new Text('Services', style: TextStyle(fontSize: 26.0)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new ServicePage()));
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              new ListTile(
                title: new Text('About Us', style: TextStyle(fontSize: 26.0)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new AboutPage()));
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              new ListTile(
                title: new Text('Contact Us', style: TextStyle(fontSize: 26.0)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new ContactPage()));
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              new ListTile(
                title: new Text('Log Out', style: TextStyle(fontSize: 26.0)),
                onTap: () async {
                  await _auth.signOut();
                },
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: StreamBuilder<UserData>(
                stream: DatabaseService(uid: user.uid).userData,
                builder: (context, snapshot) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 100.0),
                        Container(
                          height: 100.0,
                          width: 1000.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            color: Colors.blue,
                            elevation: 7.0,
                            child: Text(
                              'Card Credits',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new CardCredits()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 100.0,
                          width: 1000.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            color: Colors.blue,
                            elevation: 7.0,
                            child: Text(
                              'Barcode Request',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new BarCodeRequest()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 100.0,
                          width: 1000.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            color: Colors.blue,
                            elevation: 7.0,
                            child: Text(
                              'Transaction Report',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new TransactionReport()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 100.0,
                          width: 1000.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            color: Colors.blue,
                            elevation: 7.0,
                            child: Text(
                              'Add Products (+)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new AddProduct()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 100.0,
                          width: 1000.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            color: Colors.blue,
                            elevation: 7.0,
                            child: Text(
                              'Products',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new Products()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 100.0,
                          width: 1000.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            color: Colors.blue,
                            elevation: 7.0,
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new ProfilePage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
