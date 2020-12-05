import 'package:flutter/material.dart';
import 'package:rynhouseware/main.dart';
import 'package:rynhouseware/pages/login.dart';

class Register extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ctrlpassword = TextEditingController();
  final _ctrlconfirmpassword = TextEditingController();
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
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
          children: [
            Container(
              height: 150,
              width: 150,
              child: Text(
                "Let's Join With Us",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sign Up",
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
                        controller: _ctrlconfirmpassword,
                        obscureText: true,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Confirm Password'),
                        validator: (val) => (val.length == 0
                            ? 'Confirm Password Wajib di Isi!'
                            : null),
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
                        'Register',
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                    child: Text(
                      "Have Account? Login!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
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
