import 'package:flutter/material.dart';
import 'package:sugar_duck/database_entities/operation.dart';
import 'package:sugar_duck/database_utility/operation_manager.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState(title);
}

class _CategoryPageState extends State<CategoryPage> {
  final String title;
  var _operations = List<Operation>.empty();

  _CategoryPageState(this.title);

  @override
  void initState() {
    super.initState();
    update();

  }

  void update() async {
    await OperationManager.update();

    setState(() {
      if (title == "Категория") {
        _operations = OperationManager.operations;
      } else {
        _operations = OperationManager.getOperationsWithCategory(
            OperationManager.nameInDataBase[title] ?? "undefined");
      }
    });
  }

  void removeOperation(String name, String date) async {
    OperationManager.deleteOperation(name, date);
  }

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
                children: [
                  Text(
                    "${_operations.length} операции",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "${title == "Категория" ? OperationManager
                        .getSumOfOperations() : OperationManager
                        .getOperationsSumWithCategory(
                        OperationManager.nameInDataBase[title] ??
                            "undefined")} RUB",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              const Divider(
                  color: Color.fromARGB(255, 46, 46, 66),
                  thickness: 2,
                  height: 30),
              Flexible(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _operations[index].name,
                                          softWrap: false,
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {removeOperation(_operations[index].name, _operations[index].date); update();},
                                    icon: Icon(Icons.backspace_outlined,
                                        color: Colors.white, size: 18)
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _operations[index].date,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text("${_operations[index].sum} RUB",
                                    softWrap: false,
                                    style: TextStyle(color: Colors.white))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Color.fromARGB(255, 46, 46, 66),
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                      );
                    },
                    itemCount: _operations.length),
              )
            ],
          ),
        ));
  }
}
