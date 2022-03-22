import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: AccountPage(),
));


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
        color: Color.fromARGB(255, 26, 26, 46),
        child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left:20, right:20),
                child: Divider(
                  height: 20,
                  thickness: 2,
                  color: const Color.fromARGB(255,46,46,66),
                ),
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
                      onTap: (){},
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
              const Padding(
                padding: const EdgeInsets.only(left:20, right:20),
                child: Divider(
                  height: 20,
                  thickness: 2,
                  color: const Color.fromARGB(255,46,46,66),
                ),
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
                      SizedBox(
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(labelText: "Enter your new password", labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          style: _sizeTextWhite,
                        ),
                        width: 300.0,
                      ),
                      Container(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: "Enter your password again", focusColor: Colors.white, iconColor: Colors.white, labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                          obscureText: true,
                          maxLines: 1,
                          style: _sizeTextWhite,
                        ),
                        width: 300.0,
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0, bottom: 15, right: 20),
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
                                "Изменить пароль",
                                style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180.0, bottom: 15),
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
                      Center(
                        child: GestureDetector(
                            onTap: (){
                              Feedback.forTap(context);
                            },
                            child: Text("Удалить профиль",
                              style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 255, 255, 255)),)),
                      ),
                    ],
                  )),
            ]
        )
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 4,
      items: const [
        BottomNavigationBarItem(
          icon:Icon(Icons.newspaper_outlined),
          label: "Новости",
          backgroundColor: Color.fromARGB(255, 34, 34, 54),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange_outlined),
          label: "Курсы валют",
          backgroundColor: Color.fromARGB(255, 34, 34, 54),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Главная",
          backgroundColor: Color.fromARGB(255, 34, 34, 54),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Настройки",
          backgroundColor: Color.fromARGB(255, 34, 34, 54),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "Профиль",
          backgroundColor: Color.fromARGB(255, 34, 34, 54),

        ),
      ],
      showSelectedLabels: false,
      unselectedItemColor: const Color.fromARGB(255, 141, 147, 171),
      selectedItemColor: const Color.fromARGB(255, 255, 255, 255),

    ),
  );
}
