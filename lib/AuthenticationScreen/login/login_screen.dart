

import 'package:expance_tracker/AuthenticationScreen/sign_up/signup_screen.dart';
import 'package:expance_tracker/Database/authentication_db/signup.dart';
import 'package:expance_tracker/models/authentication/authentication_model.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginsrc extends StatelessWidget {
  loginsrc({super.key});

//gradient effect of front login screen text
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 32, 238, 35),
      Color.fromARGB(255, 16, 190, 217),
      Color.fromARGB(255, 220, 42, 191)
    ],
  ).createShader(const Rect.fromLTWH(10.0, 10.0, 250.0, 90.0));

  final _emaileditcontrol = TextEditingController();
  final _passwordeditcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Card(
        elevation: 0.0,
        margin: const EdgeInsets.only(
            left: 50.0, right: 32.0, top: 100.0, bottom: 0.0),
        color: const Color.fromARGB(225, 255, 255, 255),
        child: FlipCard(
          alignment: Alignment.center,
          direction: FlipDirection.VERTICAL,
          side: CardSide.FRONT,
          speed: 1000,
          onFlipDone: (status) {
            print(status);
          },
          front: Container(
            width: 300,
            height: 500,
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                )
              ],
            ),
          ),
          back: Container(
            width: 300,
            height: 500,
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emaileditcontrol,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      filled: true,
                      fillColor: Colors.white24,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordeditcontrol,
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      filled: true,
                      fillColor: Colors.white24,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(144, 255, 255, 255))),
                  onPressed: () {
                    checkvaluesfrominput_to_db(context);
                  },
                  child: const Text(
                    'login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Need an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(signupsrc.routename);
                      },
                      child: const Text('Signup'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkvaluesfrominput_to_db(BuildContext ctx) async {
    final _email = _emaileditcontrol.text;
    final _password = _passwordeditcontrol.text;
    if (_email.isEmpty) {
      return;
    }
    if (_password.isEmpty) {
      return;
    }
    List<AuthenticationModel> db_values = await getlogindetails();
    for (var item in db_values) {
      if ((_email == item.email) && (_password == item.password)) {
        Navigator.of(ctx).pushNamed(Home.routename);
        break;
      }
      else{
        return;
      }
    }
  }
}
