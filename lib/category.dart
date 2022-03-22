import 'package:flutter/material.dart';


class CategoryPage extends StatefulWidget {
  final String title;
  const CategoryPage({ Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 26, 26, 46),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 26, 26, 46),
        child: Column(
          children: [
            const Divider(
              color: Color.fromARGB(255, 46, 46, 66),
              indent: 20,
              endIndent: 20,
              thickness: 2,
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "3 операции",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                Text(
                  "1500 RUB",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 46, 46, 66),
              thickness: 2,
              height: 30
            ),
            Flexible(
              child: ListView.separated(
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    height: 80,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Покупка цветов маме",
                                    softWrap: false,
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                  Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                    size: 15
                                  ),
                                ],
                              )
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.backspace_outlined,
                              color: Colors.white,
                              size: 18
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "5.09.22",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Text(
                              "500 RUB",
                              softWrap: false,
                              style: TextStyle(
                                color: Colors.white
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }, 
                separatorBuilder: (BuildContext context, int index){
                  return const Divider(
                    color: Color.fromARGB(255, 46, 46, 66),
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                  );
                }, 
                itemCount: 3
              ),
            )
          ],
        ),
      )
    );
  }
}