import 'package:flutter/material.dart';
import 'package:budget_management/constants.dart';
import 'package:budget_management/menu.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.orange[100],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                child: Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppConstants.searchGrey,
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Email",
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                child: Container(
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffix: TextButton(
                        child: Text(
                          "göster",
                          style: TextStyle(color: Colors.orange),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Menu();
                              }));
                        },
                      ),
                      filled: true,
                      fillColor: AppConstants.searchGrey,
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Şifre",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize: Size(250, 50),
                        primary: AppConstants.grey),
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Menu();
                          }));
                    },
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.orange),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}