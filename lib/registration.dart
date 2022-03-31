import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugar_duck/database_utility/client_manager.dart';

import 'database_entities/client.dart';


class RegistrationPage extends StatelessWidget {
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    String checkingPassword = "";

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 26, 46),
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 26, 26, 46),
          elevation: 0,
          title: Text(
            'Регистрация',
            style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left:20, right:20),
                    child: Divider(
                      height: 20,
                      thickness: 2,
                      color: Color.fromARGB(255,46,46,66),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:40),
                    child: Image.asset("assets/picture.png"),
                  ),
                  SizedBox(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(labelText: "Email", labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (text){email = text;},
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      style: _sizeTextWhite,
                    ),
                    width: 300.0,
                  ),
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Password", focusColor: Colors.white, iconColor: Colors.white, labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (text){password = text;},
                      obscureText: true,
                      maxLines: 1,
                      style: _sizeTextWhite,
                    ),
                    width: 300.0,
                    padding: const EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Enter your password again", focusColor: Colors.white, iconColor: Colors.white, labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (text){checkingPassword = text;},
                      obscureText: true,
                      maxLines: 1,
                      style: _sizeTextWhite,
                    ),
                    width: 300.0,
                    padding: const EdgeInsets.only(top: 10.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                    child: MaterialButton(
                      elevation: null,
                      onPressed: (){
                        print("$email $password $checkingPassword");
                        if (checkingPassword != password) {
                          print("Failed to validate password");
                        }

                        Client client = Client(id: 0, email: email, password: password, currency: "RUB");

                        ClientManager.newClient(client);
                      },
                      color: const Color.fromARGB(255, 26, 26, 46),
                      splashColor: Colors.white,
                      height: 40.0,
                      minWidth: 120.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.white)),
                      child: Text(
                        "Зарегистрироваться",
                        style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/auth');
                      },
                      child: Text("Войти", style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255)),)),
                ]
              )
          ),
        ),
      ),
    );
  }

}

