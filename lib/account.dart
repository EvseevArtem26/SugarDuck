import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import './components/navbar.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);


  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      centerTitle: true,
      leading: null,
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 26, 26, 46),
      elevation: 0,
      title: Text(
        'Профиль',
        style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 255, 255, 255)),
      ),
    ),
    body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 26, 26, 46),
        child: Column(
            children: [
              const Divider(
                height: 20,
                thickness: 2,
                color: Color.fromARGB(255,46,46,66),
                indent: 20,
                endIndent: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("EMAIL", style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: GestureDetector(
                      onTap: (){Navigator.pushNamed(context, '/account/email');},
                      child: Text("Изменить", style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                    ),
                  ),
                ],),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 15),
                    child: Text("Email@yandex.ru", style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
                color:Color.fromARGB(255,46,46,66),
                indent: 20,
                endIndent: 20
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 15, bottom: 10) ,
                    child: Text("Смена пароля", style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                  ),
                ],
              ),
              Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          constraints: BoxConstraints.tightFor(
                            width: 320,
                            height: 40
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 46, 46, 66),
                            ),
                          ),
                          fillColor: Color.fromARGB(255, 34, 34, 54),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 46, 46, 66),
                            )
                          ),
                          hintText: "Введите новый пароль",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(128, 255, 255, 255),
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        style: _sizeTextWhite,
                      ),
                      Padding(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            constraints: BoxConstraints.tightFor(
                              width: 320,
                              height: 40
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 46, 46, 66),
                              ),
                            ),
                            fillColor: Color.fromARGB(255, 34, 34, 54),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 46, 46, 66),
                              )
                            ),
                            hintText: "Повторите новый пароль",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(128, 255, 255, 255),
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                            ),
                          ),
                          obscureText: true,
                          maxLines: 1,
                          style: _sizeTextWhite,
                        ),
                        padding: const EdgeInsets.only(top: 10.0, bottom: 25),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 145,
                          child: MaterialButton(
                            elevation: null,
                            onPressed: (){},
                            color: const Color.fromARGB(255, 26, 26, 46),
                            splashColor: Colors.white,
                            height: 40.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.white)),
                            child: Center(
                              child: Text(
                                "Изменить пароль",
                                softWrap: false,
                                style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: MaterialButton(
                  elevation: null,
                  onPressed: (){},
                  color: const Color.fromARGB(255, 26, 26, 46),
                  splashColor: Colors.white,
                  height: 40.0,
                  minWidth: 120.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white)),
                  child: Text(
                    "Выйти",
                    style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Feedback.forTap(context);
                },
                child: Text(
                  "Удалить профиль",
                  style: GoogleFonts.manrope(
                    fontSize: 12, 
                    fontWeight: FontWeight.w600, 
                    color: const Color.fromARGB(255, 255, 255, 255)
                  ),
                )
              ),
            ]
        )
    ),
    bottomNavigationBar: NavBar(initialIndex: 4,)
  );
}
