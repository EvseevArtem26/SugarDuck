import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:card_swiper/card_swiper.dart';
import './components/category.dart';


class IncomePage extends StatefulWidget {
  const IncomePage({ Key? key }) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {

  String title = "доходы";
  Map<String, double> dataMap = {
    "Доходы": 50,
    "Расходы": 50,
  };
  List<Color> colorList = const [
    Color.fromARGB(255, 138, 164, 255),
    Color.fromARGB(255, 50, 76, 167)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
                itemBuilder:(BuildContext context, int index){
                  return Stack(
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        colorList: colorList,
                        chartType: ChartType.ring,
                        chartRadius: 170,
                        legendOptions: const LegendOptions(
                          showLegends: false
                        ),
                      ),
                      const Center(
                        child: Text(
                          "cентябрь\n2022",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            
                          )
                        ),
                      )
                    ]
                  );
                },
                itemCount: 3, 
                loop: false,
                control: const SwiperControl(
                  color: Color.fromARGB(255, 141, 147, 171),
                  disableColor: Colors.transparent,
                  padding: EdgeInsets.all(10),
                )
              )
              ),
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
                          Tab(
                            text: "Расходы"
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 9,
                      child: TabBarView(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text(
                                        "Посмотреть все операции",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    ],
                                  )
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text(
                                        "Посмотреть все операции",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    ],
                                  )
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                                Category(
                                  width: 320,
                                  height: 60,
                                  padding: 20,
                                  sideColor: Color.fromARGB(255, 138, 164, 255),
                                ),
                              ],
                            ),
                          ),
                        ]
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}