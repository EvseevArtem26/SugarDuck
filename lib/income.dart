import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:sugar_duck/database_utility/operation_manager.dart';
import './components/category.dart';

class IncomePage extends StatefulWidget {
  int initialType;

  IncomePage({Key? key, this.initialType = 0}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState(type: initialType);
}

class _IncomePageState extends State<IncomePage> {
  _IncomePageState({this.type = 0});

  List<String> titles = ["доходы", "расходы"];
  List<Map<String, double>> dataMap = [
    {
      "Зарплата": OperationManager.getOperationsSumWithCategory("salary"),
      "Подарки": OperationManager.getOperationsSumWithCategory("gifts"),
      "Пособия": OperationManager.getOperationsSumWithCategory("benefits"),
      "Прочие доходы":
          OperationManager.getOperationsSumWithCategory("other income"),
    },
    {
      "Одежда": OperationManager.getOperationsSumWithCategory("clothes"),
      "Еда и напитки":
          OperationManager.getOperationsSumWithCategory("food and drinks"),
      "Развлечения":
          OperationManager.getOperationsSumWithCategory("entertainments"),
      "Прочие расходы":
          OperationManager.getOperationsSumWithCategory("other expenses"),
    }
  ];
  List<List<Color>> ColorList = const [
    [
      Color.fromARGB(255, 150, 200, 100),
      Color.fromARGB(255, 219, 88, 86),
      Color.fromARGB(255, 93, 110, 155),
      Color.fromARGB(255, 255, 250, 120)
    ],
    [
      Color.fromARGB(255, 247, 247, 247),
      Color.fromARGB(255, 255, 250, 120),
      Color.fromARGB(255, 255, 210, 45),
      Color.fromARGB(255, 122, 122, 122),
    ]
  ];
  int type;

  List<Widget> getCategories(int type) {
    List<Widget> categories = List.generate(
        4,
        (index) => Category(
              amount: OperationManager.getOperationsCountWithCategory(
                  OperationManager
                          .nameInDataBase[dataMap[type].keys.toList()[index]] ??
                      "undefined"),
              sum: dataMap[type].values.toList()[index],
              title: dataMap[type].keys.toList()[index],
              width: 320,
              height: 60,
              padding: 20,
              sideColor: ColorList[type][index],
            ));
    return categories;
  }

  List months =
  ['Январь', 'Февраль', 'Март', 'Апрель', 'Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialType,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                type = tabController.index;
              });
            }
          });

          return Scaffold(
            appBar: AppBar(
              title: Text(titles[type]),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 26, 26, 46),
            ),
            body: Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 26, 26, 46),
              child: Column(
                children: [
                  const Divider(),
                  //Диаграмма
                  Flexible(
                      flex: 4,
                      child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(children: [
                              PieChart(
                                dataMap: dataMap[type],
                                colorList: ColorList[type],
                                chartType: ChartType.ring,
                                chartRadius: 170,
                                legendOptions:
                                    const LegendOptions(showLegends: false),
                              ),
                              Center(
                                child: Text("${months[DateTime.now().month - 1]}\n${DateTime.now().year}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              )
                            ]);
                          },
                          itemCount: 1,
                          loop: false,
                          control: const SwiperControl(
                            color: Color.fromARGB(255, 141, 147, 171),
                            disableColor: Colors.transparent,
                            padding: EdgeInsets.all(10),
                          ))),
                  //Категории
                  Flexible(
                      flex: 6,
                      child: Column(
                        children: [
                          const Flexible(
                            flex: 1,
                            child: TabBar(
                              tabs: [
                                Tab(
                                  text: "Доходы",
                                ),
                                Tab(text: "Расходы")
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 9,
                            child: TabBarView(children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: ([
                                        Container(
                                            width: double.infinity,
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/category_all');
                                                  },
                                                  child: const Text(
                                                    "Посмотреть все операции",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Feedback.forTap(context);
                                                    Navigator.pushNamed(context,
                                                        '/incomeOperation');
                                                  },
                                                  icon: const Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ].cast<Widget>()) +
                                      getCategories(0),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: ([
                                        Container(
                                            width: double.infinity,
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/category_all');
                                                  },
                                                  child: const Text(
                                                    "Посмотреть все операции",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        '/expenseOperation');
                                                  },
                                                  icon: const Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ].cast<Widget>()) +
                                      getCategories(1),
                                ),
                              ),
                            ]),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
