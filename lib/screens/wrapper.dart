import 'package:Barkod724/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:Barkod724/screens/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:Barkod724/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
