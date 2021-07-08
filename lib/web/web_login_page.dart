import 'package:flutter/material.dart';
import 'package:healthbit/utils/svg_getter.dart';
import 'package:healthbit/web/web_register_page_connector.dart';

class WebLoginPage extends StatefulWidget {
  Function onLogin;

  WebLoginPage({required this.onLogin});

  @override
  _WebLoginPageState createState() => _WebLoginPageState();
}

class _WebLoginPageState extends State<WebLoginPage> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
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
              width: MediaQuery.of(context).size.width / 5,
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
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
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff264b89)),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pushNamed(context, WebRegisterPageConnector.id);
                  },
                  child: const Text(
                    'Register',
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff264b89)),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    widget.onLogin(email);
                  },
                  child: const Text(
                    'Log in',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
