import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'components/navbar.dart';
import 'network/exchange_rates.dart';


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
  Map<String, String>currencies = ExchangeRates.currencies;

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
              const Divider(
                height: 20,
                thickness: 2,
                color: Color.fromARGB(255,46,46,66),
                indent: 20,
                endIndent: 20
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 15, bottom: 10) ,
                    child: Text(
                      "Выбор валюты", 
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      )
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left:20, right:20, bottom: 15),
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
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: currencies.length,
                  itemBuilder: (context, index){
                      return Currency(
                        code: currencies.keys.toList()[index], 
                        title: currencies.values.toList()[index]
                      );
                  },
                ),
              ),
      ])),
      bottomNavigationBar: NavBar()
  );

  
}

class Currency extends StatelessWidget{
  const Currency({required this.code, required this.title});
  final String code;
  final String title;

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
                  Flexible(
                    child: Text(
                      title,
                      style: GoogleFonts.manrope(
                        fontSize: 12, 
                        fontWeight: FontWeight.w400, 
                        color: const Color.fromARGB(255, 255, 255, 255)
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      code,
                      style: GoogleFonts.manrope(
                        fontSize: 13, 
                        fontWeight: FontWeight.w700, 
                        color: const Color.fromARGB(255, 255, 255, 255)
                      )
                    ),
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


