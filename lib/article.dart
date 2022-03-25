import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';



void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ArticlePage(),
));



class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

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
            const Padding(
              padding: EdgeInsets.only(left:20, right:20),
              child: Divider(
                height: 20,
                thickness: 2,
                color: Color.fromARGB(255,46,46,66),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text("Forbes узнал об открытии фондового рынка в России в «разделенном» виде", style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255))),
            ),
            const Padding(
              padding: EdgeInsets.only(left:20, right:20),
              child: Divider(
                height: 20,
                thickness: 2,
                color: Color.fromARGB(255,46,46,66),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Text("Центробанк обсуждает возможность разделения российского фондового рынка на два: для резидентов внутри России и для нерезидентов за ее границами. Об этом со ссылкой на три источника сообщает российская редакция Forbes. ЦБ обсуждает возможность создания двух рынков акций — оншорного для резидентов и офшорного для нерезидентов.Это нужно для того, чтобы предотвратить панику среди российских инвесторов после открытия бирж, когда иностранные держатели бумаг российских эмитентов будут массово выходить из активов», — пишет издание. По словам одного из источников, для этого будут использоваться счета «типа C, на которые будут зачисляться бумаги нерезидентов», каковыми будут считаться и все иностранные «дочки» российских брокеров.Forbes отмечает, что решение о том, признавать ли «дочки» российских брокеров резидентами или нерезидентам, еще не принято. «Это мера сейчас обсуждается и, вероятно, будет реализована», — цитирует издание президента Национальной ассоциации, то, скорее всего, без участия нерезидентов. «Так что у рынка выбор — вовсе оставить нерезидентов без торговли либо дать им возможность торговать в отдельном «стакане». В любом случае решение этой задачи не должно задерживать открытие рынка для резидентов», — сказал Тимофеев. «Когда рынок почувствует себя увереннее, меры валютного контроля могут быть сняты и отпадет необходимость в разделении рынка», — подчеркнул добавил он.Центробанк обсуждает возможность разделения российского фондового рынка на два: для резидентов внутри России и для нерезидентов за ее границами. Об этом со ссылкой на три источника сообщает российская редакция Forbes. ЦБ обсуждает возможность создания двух рынков акций — оншорного для резидентов и офшорного для нерезидентов.Это нужно для того, чтобы предотвратить панику среди российских инвесторов после открытия бирж, когда иностранные держатели бумаг российских эмитентов будут массово выходить из активов», — пишет издание. По словам одного из источников, для этого будут использоваться счета «типа C, на которые будут зачисляться бумаги нерезидентов», каковыми будут считаться и все иностранные «дочки» российских брокеров.Forbes отмечает, что решение о том, признавать ли «дочки» российских брокеров резидентами или нерезидентам, еще не принято. «Это мера сейчас обсуждается и, вероятно, будет реализована», — цитирует издание президента Национальной ассоциации, то, скорее всего, без участия нерезидентов. «Так что у рынка выбор — вовсе оставить нерезидентов без торговли либо дать им возможность торговать в отдельном «стакане». В любом случае решение этой задачи не должно задерживать открытие рынка для резидентов», — сказал Тимофеев. «Когда рынок почувствует себя увереннее, меры валютного контроля могут быть сняты и отпадет необходимость в разделении рынка», — подчеркнул добавил он.",
                    style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 255, 255, 255),
                    ),),
                ),
              ),
            ),
          ],
        ),
    ),
  );
}