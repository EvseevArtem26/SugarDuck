import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: EmailChangePage(),
));

class EmailChangePage extends StatelessWidget {
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);

  const EmailChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 26, 46),
        appBar: AppBar(
          leading: IconButton(
              color: const Color.fromARGB(255,141, 147, 171),
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.arrow_back_ios_new_rounded)
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 26, 26, 46),
          elevation: 0,
          title: Text(
            'Смена email',
            style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 26, 26, 46),
          child: Form(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left:20, right:20),
                    child: Divider(
                      height: 20,
                      thickness: 2,
                      color: Color.fromARGB(255,46,46,66),
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(labelText: "New email", labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      style: _sizeTextWhite,
                    ),
                    width: 300.0,
                  ),
                  SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Password", focusColor: Colors.white, iconColor: Colors.white, labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                      obscureText: true,
                      maxLines: 1,
                      style: _sizeTextWhite,
                    ),
                    width: 300.0,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15.0, right: 20.0),
                        child: MaterialButton(
                          elevation: null,
                          onPressed: (){},
                          color: const Color.fromARGB(255, 26, 26, 46),
                          splashColor: Colors.white,
                          height: 40.0,
                          minWidth: 120.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.white)),
                          child: Text(
                            "Сохранить",
                            style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

