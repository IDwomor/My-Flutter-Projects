import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_tutorial/custom_textfield.dart';
import 'package:flutter_project_tutorial/homepage.dart';
import 'package:flutter_project_tutorial/log_in_page.dart';
import 'package:flutter_project_tutorial/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_project_tutorial/custom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _auth = AuthService();

  final _controller = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool isObscureText = false;

  @override
  void dispose() {//we have to dispose the controllers to avoid memory leaks
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
                Icons.notifications), //adding a notification icon at the top
          ),
        ],
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
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 5),
                child: CustomTextField(
                  controller: _nameController,
                  prefixIcon: const Icon(Icons.drive_file_rename_outline),
                  hintText: "Name",
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: CustomTextField(
                  controller: _emailController,
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomTextField(
                    controller: _passController,
                    hintText: "Password",
                    obscureText: isObscureText,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: togglePassword()),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomTextField(
                    controller: _confirmPassController,
                    hintText: "Confirm Password",
                    obscureText: isObscureText,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: togglePassword()),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                /*child: const Text(
                  "Enter your phone number to sign up",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.1,
                      fontStyle: FontStyle.normal),
                ),*/
              ),
              //const SizedBox(height: 1),
              Column(
                children: <Widget>[
                  // SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: IntlPhoneField(
                      dropdownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      cursorColor: Colors.lightBlue,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        //labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 10, color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        constraints: BoxConstraints(
                            maxHeight: height * 0.093, maxWidth: width),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                              width: 1.0,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.lightBlue,
                            width: 1.0,
                          ),
                        ),
                      ),
                      pickerDialogStyle: PickerDialogStyle(
                        listTilePadding: const EdgeInsets.all(5),
                        padding:
                            const EdgeInsets.only(top: 5, right: 15, left: 15),
                        countryCodeStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                        countryNameStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                        backgroundColor: Colors.white,
                        searchFieldInputDecoration: InputDecoration(
                          constraints: BoxConstraints(
                            minHeight: 0.5,
                            minWidth: width,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                            weight: 10,
                          ),
                          labelText: 'Search Country',
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        //width: 1000
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                              builder: (context) => _signup()
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Or sign up with",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.facebook)),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.apple)),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.tiktok)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UpdatedCurrencyConverterApp()),
                          );
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }

  togglePassword(){
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

  goToHome(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LogInPage())
  );

  _signup() async{
    final user = await _auth.createUserWithEmailAndPassword(_emailController.text, _passController.text);
    if(user != null) {
      log("User created successfully");
      goToHome(context);
    }
  }


  /*Widget signOutButton() {
    return ElevatedButton(
        onPressed: signOut,
        child: const Text("Sign Out")
    );
  }*/

   /* Future<Widget> _signUp() async{
    String username = _nameController.text;
    String email = _emailController.text;
    String password = _passController.text;
    String confirmPassword = _confirmPassController.text;

    User? user =await _auth.signUpWithEmailAndPassword(email, password);

    if(user != null){
      print("User is successfully created");
      Navigator.pushNamed(
        context, "/homepage");
    } else{
      print("Some error occured");
    }
  }*/
}

//Set 'android:enableOnBackInvokedCallback="true"' in the application manifest.
//async keyword allows the function to use the await keyword inside it
//the await keyword is used to pause the execution of an asynchronous function until a particular asynchronous operation is completed
//In flutter, many asynchronous operations return Future objects. Common scenarios include fetching data from an API, reading/writing to a database, or executing time consuming computations