// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class Validator extends StatefulWidget {
  const Validator({super.key});

  @override
  State<Validator> createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    var name = TextEditingController();
    var email = TextEditingController();
    var number = TextEditingController();
    var password = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 45, 87),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            'Registration',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 4),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'images/business.png',
                        width: 120,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VALIDATION FORM',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name : ',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid name';
                          }
                          return null;
                        },
                        controller: name,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email : ',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a valid email';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+$")
                              .hasMatch(value)) {
                            print('object');
                            return 'Email must contain and @ symbol';
                          }
                          return null;
                        },
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Number : ',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid number';
                          }
                          return null;
                        },
                        controller: number,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50),
                child: Row(
                  children: [
                    Text(
                      'Password : ',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid Password';
                          }
                          
                          if (!RegExp(
                                  r'^(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}|:"<>?])[A-Za-z\d!@#$%^&*()_+{}|:"<>?]{8,}$')
                              .hasMatch(value)) {
                            return 'Password must contain at least 1 capital letter and 1 symbol';
                          }

                          return null;
                        },
                        controller: password,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState?.validate() ?? false) {
                            print(name.text);
                            print(email.text);
                            print(number.text);
                            print(password.text);
                          }
                        },
                        child: Text('Submit')),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
