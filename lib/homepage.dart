import 'package:flutter/material.dart';
import 'package:flutter_project_tutorial/custom_textfield.dart';
import 'package:flutter_project_tutorial/custom_button.dart';
import 'package:flutter_project_tutorial/sign_up_page.dart';

import 'log_in_page.dart';

class UpdatedCurrencyConverterApp extends StatefulWidget {
  const UpdatedCurrencyConverterApp(
      {super.key}); //constructor for the main.dart

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<UpdatedCurrencyConverterApp>
      createState() => //whenever the state of a stateful widget changes, flutter rebuilds the widget tree to reflect those changes
          _UpdatedCurrencyConverterAppState();
}
//when you create a stateful widget, flutter calls the createState() method to create a corresponding State object that manages the state of the widget

class _UpdatedCurrencyConverterAppState
    extends State<UpdatedCurrencyConverterApp> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool isObscureText = false;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Currency Converter'),
        backgroundColor: Colors.lightBlue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        /*actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
                Icons.notifications), //adding a notification icon at the top
          ),
        ],*/
        //leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: Image.asset(
                  'assets/images/currency.jpg',
                  width: 500,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: CustomTextField(
                  controller: _emailController,
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Type your Email",
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomTextField(
                    controller: _passController,
                    hintText: "Type your Password",
                    obscureText: isObscureText,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: togglePassword()),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 82),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            focusColor: Colors.lightBlue,
                            activeColor: Colors.lightBlue,
                            value: isChecked,
                            //tristate: true,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool;
                              });
                            },
                          ),
                          const Text("Remember me",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),


                     Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        //style: buttonPrimary,
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13),
                        ),
                      ),
                    ),

                ],
              ),
              Container(
                height: 48,
                width: 340,
                child: OutlinedButton(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      side: const WidgetStatePropertyAll(
                        BorderSide(width: 0, color: Colors.white),
                      ),
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.lightBlue)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInPage()),
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.lightBlue,
              ),
              const SizedBox(height: 1),
              Container(
                height: 48,
                width: 340,
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      side: const WidgetStatePropertyAll(
                        BorderSide(width: 1, color: Colors.grey),
                      ),
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {},
                  label: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Continue with facebook',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 48,
                width: 340,
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      side: const WidgetStatePropertyAll(
                        BorderSide(width: 1, color: Colors.grey),
                      ),
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {},
                  label: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Continue with google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  icon: const Icon(
                    Icons.web_asset,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget togglePassword() {
    // var isObscureText;
    return IconButton(
      onPressed: () {
        setState(() {
          isObscureText = !isObscureText;
        });
      },
      icon: isObscureText
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off_outlined),
    );
  }
}
