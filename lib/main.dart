import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:iconly/iconly.dart';
import 'package:nectar/classes/colors.dart';
import 'package:nectar/pages/login.dart';
import 'package:nectar/pages/shop.dart';

void main() => runApp(const MyApp());

final colors = MyColors();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginScreen(),
        '/shop': (context) => ShopPage(
              email: email.text,
            ),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/onbording.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: const FaIcon(
                FontAwesomeIcons.carrot,
                color: Colors.white,
                size: 50,
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 15),
                child: const Text(
                  'Welcome \nto our store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  'Get you groceries in as fast as one hour',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      height: 1),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 40, bottom: 90),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.success,
                    minimumSize: const Size(350, 60),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
