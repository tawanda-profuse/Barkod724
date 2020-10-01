import 'package:Barkod724/screens/home/pages/admin/admin.dart';
import 'package:Barkod724/screens/home/pages/barcode_request.dart';
import 'package:Barkod724/screens/home/pages/cardcredits.dart';
import 'package:Barkod724/screens/wrapper.dart';
import 'package:Barkod724/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Barkod724/models/user.dart';
import 'package:Barkod724/screens/authenticate/welcome_screen.dart';
import 'screens/authenticate/login.dart';
import 'package:Barkod724/screens/home/pages/client/provider/user_provider.dart';

//Pages
import 'contact_us.dart';
import 'package:Barkod724/screens/home/home_page.dart';
import 'screens/home/pages/client/provider/app_provider.dart';
import 'services_page.dart';
import 'screens/authenticate/signup.dart';

// void main() => runApp(MyApp()); .... originally
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: AppProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepOrange),
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => new SignupPage(),
          '/home_page': (BuildContext context) => new HomePage(),
          '/services': (BuildContext context) => new ServicePage(),
          '/landingpage': (BuildContext context) => new ScreensController(),
          '/signin': (BuildContext context) => new LoginPage(),
          '/contact': (BuildContext context) => new ContactPage(),
          '/welcome': (BuildContext context) => new WelcomePage(),
          '/cardcredits': (BuildContext context) => new CardCredits(),
          '/barcoderequest': (BuildContext context) => new BarCodeRequest(),
          '/admin': (BuildContext context) => new Admin(),
        },
        home: Wrapper(),
        theme: ThemeData(accentColor: Colors.blueAccent),
      ),
    );
  }
}
