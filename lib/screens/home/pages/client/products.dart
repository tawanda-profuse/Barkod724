import 'package:Barkod724/settingspage/settings_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../home_page.dart';

//pages
import 'custom_app_bar.dart';
import 'search.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class ProductsService {
  Firestore _firestore = Firestore.instance;
  String collection = 'products';

  Future<List<Product>> getFeaturedProducts() =>
      _firestore.collection(collection).getDocuments().then((snap) {
        List<Product> featuredProducts = [];
        snap.documents.map(
            (snapshot) => featuredProducts.add(Product.fromSnapshot(snapshot)));
        return featuredProducts;
      });
}

class _ProductsState extends State<Products> {
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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//           Custom App bar
            CustomAppBar(),

//          Search Text field
            Search(),

//            featured products

            // Text(
            //   appProvider.featureProducts.length.toString(),
            //   style: TextStyle(color: Colors.black),
            // ),
//          recent products
          ],
        ),
      ),
    );
  }
}
