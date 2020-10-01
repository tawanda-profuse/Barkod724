import 'package:flutter/material.dart';

//Pages

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Services'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2,
                      children: [
                        TextSpan(
                            text:
                                '\nBarcode724 is considered to be one of the most practical solutions that could be offered for manipulating barcode operations. Barcode724 is a comprehensive distributed solution that consists of:',
                            style: TextStyle(fontSize: 20.0)),
                        TextSpan(
                          text: '\n\n- e-Barcode724\n- ABM',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '\n\ne-Barcode724',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' offers an international access to our barcode solution over the global Internet network. It facilitates barcode-related operations through offering several services presented using an extremely easy-to-use graphical-user-interface. It offers:\n\n• New barcode generation and verification.\n• Requesting barcode printing.\n• Adding new products.\n• Credits investigation.\n• Showing all firm transactions.\n• Giving up-to-date reports and logs about all transactions done by members.\n\nOur e-Barcode724 solution could be accessed through the ‘Login’ link after joining us by following few steps below.',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: '\n\nAuto Barcode Machine (ABM)',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' solution part has been designed to represent a fully automated barcode services. ABM offers:\n\n• Fully automated barcode printing.\n• Listing and updating customer’s products.\n• Handling e-requests which done through our e-barcode724 site.\n• Credits investigation.\nABM is accessible only through our local site and after taking a membership by following few simple steps.',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        TextSpan(
                            text:
                                '\n\nTo take a deep look on ABM, please click here.\n\nWe are glad to say that, Barcode724 offers a completely automated tied solution by introducing its two cooperative parts (e-barcode724 and ABM) and gives our customers the highest availability and flexibility.\n\nTo become a member, just click here and follow the instruction given.',
                            style: TextStyle(fontSize: 20.0)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
