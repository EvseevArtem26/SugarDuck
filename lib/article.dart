import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class ArticlePage extends StatelessWidget {
  final String title;
  final String content;

  const ArticlePage({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color.fromARGB(255, 26, 26, 46),
    appBar: AppBar(
      leading: IconButton(
        color: const Color.fromARGB(255,141, 147, 171),
        onPressed: Navigator.of(context).pop,
        icon: Icon(Icons.arrow_back_ios_new_rounded)
    ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 26, 26, 46),
      elevation: 0,
      title: Text(
        'Статья',
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
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(title, style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255))),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              color: Color.fromARGB(255,46,46,66),
              indent: 20,
              endIndent: 20,
            ),
            //widget to display the article content
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Expanded(
                    child: Text(
                      content,
                      style: GoogleFonts.manrope(
                        fontSize: 12, 
                        fontWeight: FontWeight.w400, 
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.visible,
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
 

