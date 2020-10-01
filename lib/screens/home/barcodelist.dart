import 'package:Barkod724/models/barcode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'barcode_tile.dart';

class BarCodeList extends StatefulWidget {
  @override
  _BarCodeListState createState() => _BarCodeListState();
}

class _BarCodeListState extends State<BarCodeList> {
  @override
  Widget build(BuildContext context) {
    final barcodes = Provider.of<List<Barcode>>(context) ?? [];

    return ListView.builder(
      itemCount: barcodes.length,
      itemBuilder: (context, index) {
        return BarCodeTile(barcode: barcodes[index]);
      },
    );
  }
}
