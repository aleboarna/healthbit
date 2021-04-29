import 'package:flutter/material.dart';
import 'package:healthbit/utils/svg_getter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            SizedBox(
                width: 200.0,
                height: 200.0,
                child: SvgGetter(source: 'assets/logo1.svg')),
            Text(
              'HealthBit',
              style: TextStyle(color: Color(0xff02235b), fontSize: 30.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                onChanged: (value) {},
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff264b89)),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              child: const Text(
                'Log in',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
