import 'package:flutter/material.dart';
import 'package:rynhouseware/main.dart';
import 'package:rynhouseware/pages/register.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ctrlpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006266),
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('lib/images/kategori/1.png'))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Log In",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: TextFormField(
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Email Address'),
                        validator: (val) => (val.length == 0
                            ? 'Email Address Wajib di Isi!'
                            : null),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: TextFormField(
                        controller: _ctrlpassword,
                        obscureText: true,
                        decoration:
                            new InputDecoration.collapsed(hintText: 'Password'),
                        validator: (val) =>
                            (val.length == 0 ? 'Password Wajib di Isi!' : null),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Material(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xff00818b),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    }
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 6, 5, 5),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Text(
                      "Register Here!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
