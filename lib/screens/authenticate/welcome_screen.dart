import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 35,
        actions: <Widget>[
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
        ],
      ),
      // resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50.0), //fromLTRB(50.0, 100.0, 50.0, 100.0),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Text(
                    ' Welcome to Barkod 7/24',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 70.0),
          Center(
            child: Container(
              height: 70.0,
              width: 300.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.blueAccent,
                color: Colors.blue,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signin');
                  },
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 40.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Center(
            child: Container(
              height: 70.0,
              width: 300.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.blueAccent,
                color: Colors.blue,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 40.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
