import 'package:flutter/material.dart';
import 'package:flutter_project_tutorial/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const UpdatedCurrencyConverterApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.lightBlue,
            child: Image.asset(
              'assets/images/currency.jpg',
              //width: 500,
              //height: 200,
            ),
          ),
          Container(
              child: const Text(
            'Currency Converter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue
            ),
          )),
        ],
      ),
    ));
  }
}
//InitState is the function that runs for the first time when your class gets called
//To replace this class, you can use the animation splash screen from pub.dev