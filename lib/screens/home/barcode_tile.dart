import 'package:flutter/material.dart';
import 'package:Barkod724/models/barcode.dart';

class BarCodeTile extends StatelessWidget {
  final Barcode barcode;
  BarCodeTile({this.barcode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(
            'Card Number: ${barcode.cardNum}' +
                '\n\nCard Holder: ${barcode.name}' +
                '\n\nAvailable Credit: ${barcode.availableCredits}' +
                '\n\nCard Limit: ${barcode.cardLimits}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
