import 'package:flutter/material.dart';

//Pages

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About Us'),
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
                  new Text(
                    '\nSince 1994 we have been in the North Cyprus Marketplace. The aim of our foundation is to educate how to give more quailified education, consious technology using with good frendship. The critiques proved that we can realise our aims.\n\nNorth Cyprus is located at the North side of the island. Cyprus is is the third biggest island after Sicilya and Sardunya in Mediterranean Sea. Since 1974 Cyprus Island has divided into two pars. One Of is North (Turkish) and the other is South (Greek). North is 70 km south of the Turkey. It has a 200,587 population and national income is aproximately 5,000.USD per year per person.\n\nTo cover the marketplace requests the company import and write and also give course of Programs to improve the customer wallet.\n\nIn 1995-1996 years GigaByte gave services only in Education and writing software for customers satisfaction. Again in 1997 we open our service center and computer accessories store. In this respect GigaByte Ltd. is not only an education center, it is also a Network and Automation service and education center in this marketplace.\n\nIn 1998 we gives Market and Store Automation systems seminars to inform the market and shop sectors and we are the first firm who produce solutions and give support.\n\n"Marking time" is not in our principles so GigaByte is in every part of the computing technology. With an professional staff and technical possibilities we are always brand new in computing technology.',
                    style: TextStyle(
                        //fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                        //color: Colors.blue[900],
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
