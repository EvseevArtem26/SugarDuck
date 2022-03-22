import 'package:flutter/material.dart';


class OperationPage extends StatefulWidget {
  const OperationPage({ Key? key }) : super(key: key);

  @override
  State<OperationPage> createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  final Map<String, List<String>> categories = {
    "income": [
      "Зарплата",
      "Подарки",
      "Пособия",
      "Другие доходы"
    ],
    "expense": [
      "Еда и питание",
      "Одежда",
      "Развлечения",
      "Другие расходы"
    ]
  };
  late String selectedCategory = categories["income"]![0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Редактирование",
        ),
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
            ),
            Form(
              child: Column(
                children: [
                  const Text(
                    "Название операции",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      constraints: BoxConstraints.tightFor(
                        width: 320,
                        height: 60
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 46, 46, 66),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 34, 34, 54),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 46, 46, 66),
                        )
                      )
                    ),
                  ),
                  const Text(
                    "Категория",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue){
                      setState(
                        (){selectedCategory = newValue!;}
                      );
                    },
                    items: categories["income"]!.map<DropdownMenuItem<String>>((String title){
                      return DropdownMenuItem(
                        value: title,
                        child: Container(
                          height: 26,
                          width: 270,
                          color: Color.fromARGB(255, 34, 34, 54),
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              backgroundColor: Color.fromARGB(255, 34, 34, 54)
                            )
                          ),
                        ),
                        alignment: Alignment.center,
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      constraints: BoxConstraints.tightFor(
                        width: 320,
                        height: 60
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 46, 46, 66),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 34, 34, 54),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 46, 46, 66),
                        )
                      )
                    ),
                  ),
                  const Text(
                    "Сумма",
                    style: TextStyle(
                      color:  Colors.white
                    )
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      constraints: BoxConstraints.tightFor(
                        width: 320,
                        height: 60
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 46, 46, 66),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 34, 34, 54),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 46, 46, 66),
                        )
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}