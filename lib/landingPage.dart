import 'package:flutter/material.dart';
import 'package:budget_management/signup.dart';
import 'package:budget_management/constants.dart';
import 'package:budget_management/login.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.orange[300],
        height: size.height,
        width: double.infinity,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top:200.0, right: 4.0, left: 4.0),
            child: Container(
              child: Text("BÜTÇEM'E HOŞGELDİNİZ!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.green
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(250, 50),
                    primary: AppConstants.grey),
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(250, 50),
                    primary: AppConstants.grey),
                child: Text(
                  "Üye Ol",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Signup();
                  }));
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}