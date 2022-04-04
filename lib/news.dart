import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import './components/navbar.dart';
import './network/news.dart';
import 'article.dart';


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
                 //futureBuilder that results in a list of articles
                 // and a loading indicator
                 child: FutureBuilder(
                   future: NewsFeed.getNews(),
                   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics:  AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: NewsCard(
                              title: snapshot.data![index]['title'],
                              date: DateTime.parse(snapshot.data![index]['pubDate']),
                              content: snapshot.data![index]['full_description'] ?? snapshot.data![index]['description'],
                            ),
                          );
                        },
                      );
                    } else {
                       return const Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                   },
                 ),
               ),
             ],
            ),
  ),
    bottomNavigationBar: NavBar()
  );


}

class NewsCard extends StatelessWidget{
  NewsCard({required this.title, required this.date, required this.content});
  final String title;
  final DateTime date;
  final String content;


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
      title: Text(title, style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255))),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: const Color.fromARGB(255, 141, 147, 171)),
      subtitle: Padding(
        padding: const EdgeInsets.only( top: 10),
        child: Text(
          //format date to dd.mm.yyyy
          date.day.toString() + '.' + date.month.toString() + '.' + date.year.toString(),
          style: GoogleFonts.manrope(
            fontSize: 12, 
            fontWeight: FontWeight.w400, 
            color: const Color.fromARGB(255, 255, 255, 255)
          ) ,
        ),
      ),
      onTap: (){
        // send title and text to article page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(
              title: title,
              content: content,
            ),
          ),
        );
      },
      
    ),
  );

}