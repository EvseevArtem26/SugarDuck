import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: NewsPage(),
));


class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      centerTitle: true,
      leading: null,
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 26, 26, 46),
      elevation: 0,
      title: Text(
        'Новости',
        style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 255, 255, 255)),
      ),
    ),
    body: Container(
      color: Color.fromARGB(255, 26, 26, 46),
         child: Column(
             children: [
               const Padding(
                 padding: EdgeInsets.only(left:20, right:20),
                 child:  Divider(
                   height: 20,
                   thickness: 2,
                   color: Color.fromARGB(255,46,46,66),
                 ),
               ),
               Expanded(
                 child: ListView.builder(
                   scrollDirection: Axis.vertical,
                   shrinkWrap: true,
                   physics:  AlwaysScrollableScrollPhysics(),
                    itemCount: 10 ,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: NewsCards().build(context),
                      );
                    },
                  ),
               ),
             ],
            ),
  ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
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

class NewsCards extends StatelessWidget{
  const NewsCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 34, 34, 54),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    height: 80,
    width: 320,
    child: ListTile(
      leading: null,
      title: Text('Forbes узнал об открытии фондового рынка в России в «разделенном» виде', style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255))),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: const Color.fromARGB(255, 141, 147, 171)),
      subtitle: Padding(
        padding: const EdgeInsets.only( top: 10),
        child: Text('5.02.22', style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 255, 255, 255)) ,),
      ),
      onTap: (){},
    ),
  );

}