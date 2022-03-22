import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SettingsPage(),
));


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String input = '';

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
        'Настройки',
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
                color: Color.fromARGB(255,46,46,66),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("ТЕКУЩАЯ ВАЛЮТА", style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text("RUB", style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                  ),
                ],),
              const Padding(
                padding: EdgeInsets.only(left:20, right:20),
                child:  Divider(
                  height: 20,
                  thickness: 2,
                  color: Color.fromARGB(255,46,46,66),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 15, bottom: 10) ,
                    child: Text("Выбор валюты", style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20, right:20, bottom: 15),
                    child: LimitedBox(
                      maxWidth: 350,
                      child: CupertinoSearchTextField(
                        placeholder: "Поиск",
                        itemColor: Colors.white,
                        onSubmitted: (text){
                          setState(() {
                            input = text;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 25,
                itemBuilder: (context, index){
                    return Currencies().build(context);
                },
              ),
            ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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

class Currencies extends StatelessWidget{
  const Currencies({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => Container(
    height: 40,
    width: 320,
    child: GestureDetector(
      onTap: (){
        Feedback.forTap(context);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Text('Австралийский доллар',style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 255, 255, 255)))),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text('AUD',style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255))),
                  ),
                ],
              ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:20, right:20),
            child: Divider(
              height: 0,
              thickness: 2,
              color: Color.fromARGB(255,46,46,66),
            ),
          ),
        ],
      ),
    ),
  );
}


