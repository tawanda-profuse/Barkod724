import 'package:flutter/material.dart';

//Pages

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Contact Us'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  new Text(
                    '\n\n\nAddress:\n61 Bolu Sokak Kizilbas- Nicosia, Cyprus (North).\n\nTelephone:\n+90 392 228 00 78 \n\nFax:\n+90 392 227 71 25\n\nOr you can send us an email at:\n\nbarcode@GigaByteLtd.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 15.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
