import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sugar_duck/database_entities/operation.dart';
import 'package:sugar_duck/database_utility/client_manager.dart';
import 'package:sugar_duck/database_utility/operation_manager.dart';

class OperationPage extends StatefulWidget {
  String type;

  OperationPage({ Key? key, this.type = "income"}) : super(key: key);

  @override
  State<OperationPage> createState() => _OperationPageState(type);
}

class _OperationPageState extends State<OperationPage> {
  _OperationPageState(this.type);

  String type;
  late Operation operation = Operation.empty();

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
  late String selectedCategory = categories[type]![0];

  addOperation() async {
    operation.category = "selectedCategory"; // TODO fix category
    operation.type = type;
    if (type == "expense") operation.sum *= -1;
    operation.client = ClientManager.currentClientID;
    operation.date = DateTime.now().toString();
    OperationManager.newOperation(operation);
    await OperationManager.update();
    Navigator.popAndPushNamed(context, "/home");
  }

  List<DropdownMenuItem<String>> getCategoryItems(String group){
    List<String> titles = categories[group]!;
    List<DropdownMenuItem<String>> items = [];
    for (var title in titles){
      items.addAll(
        [
          DropdownMenuItem(
            value: title,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                )
              ),
            ),
            alignment: Alignment.center,
          ),
          if (title != titles.last)
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(
              color: Color.fromARGB(255, 34, 34, 54),
              thickness: 2,
              height: 1,
            ),
          ),
        ]
      );
    }
    return items;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Редактирование",
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 26, 26, 46),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: Color.fromARGB(255, 26, 26, 46),
        child: Column(
          children: [
            const Divider(
              color: Color.fromARGB(255, 46, 46, 66),
              indent: 20,
              endIndent: 20,
              thickness: 2,
              height: 2
            ),
            Form(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 10, left: 40),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Название операции",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  TextFormField(
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

                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (text)
                      {
                        operation.name = text;
                      }
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 10, left: 40),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Категория",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 320,
                    child: DropdownButtonFormField2<String>(
                      onChanged: (String? newValue){
                        setState(
                          (){selectedCategory = newValue!;}
                        );
                      },
                      hint: const Text(
                        "Выберите категорию",
                        style: TextStyle(
                          color: Color.fromARGB(128, 255, 255, 255)
                        )
                      ),
                      items: getCategoryItems(type),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero
                      ),
                      buttonDecoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 34, 54),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 46, 46, 66)
                        )
                      ),
                      isExpanded: true,
                      buttonHeight: 40,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                      itemHeight: 20,
                      dropdownDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                        color: Color.fromARGB(255, 46, 46, 66)
                      ),
                      dropdownWidth: 320,
                      offset: const Offset(0, 10),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 10, left: 40),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Сумма",
                      style: TextStyle(
                        color:  Colors.white
                      )
                    ),
                  ),
                  TextFormField(
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
                      )
                    ),
                    style: const TextStyle(
                      color: Colors.white
                    ),
                    onChanged: (text){
                      operation.sum = double.parse(text);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            color: Colors.white,
                            width: 2
                          )
                        )
                        
                      ),
                      child: const Text(
                        "Добавить",
                        style: TextStyle(
                          color:  Colors.white
                        ),
                      ),
                      onPressed: addOperation,
                    )
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