import 'package:flutter/material.dart';
import 'package:healthbit/utils/svg_getter.dart';
import 'package:healthbit/web/web_home_page_connector.dart';

class WebRegisterPage extends StatefulWidget {
  @override
  _WebRegisterPageState createState() => _WebRegisterPageState();
}

class _WebRegisterPageState extends State<WebRegisterPage> {
  bool _isDoc = false;
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
              width: MediaQuery.of(context).size.width / 5,
              child: TextField(
                onChanged: (value) {},
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
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
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Are you a doctor?',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Switch(
                    value: _isDoc,
                    onChanged: (newValue) {
                      setState(() {
                        if (_isDoc) {
                          _isDoc = false;
                        } else
                          _isDoc = true;
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff264b89)),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_isDoc) {
                  Navigator.pushNamed(context, WebHomePageConnector.id);
                }
              },
              child: const Text(
                'Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
