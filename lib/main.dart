import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'settings.dart';
import 'package:card_swiper/card_swiper.dart';
import './components/navbar.dart';
import 'income.dart';
import 'category.dart';
import 'operation.dart';
import 'exchange.dart';
import 'news.dart';
import 'article.dart';
import 'account.dart';
import 'emailChange.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
			initialRoute: '/home',
			routes: {
        // '/': (context) => AuthPage(),
        '/home': (context) => HomePage(title: "Главная"),
        '/income': (context) => IncomePage(initialType: 0),
        '/expense': (context) => IncomePage(initialType: 1,),
        '/category': (context) => CategoryPage(title: "Категория"),
        '/operation': (context) => OperationPage(),
        '/exchange': (context) => ExchangePage(),
        '/settings': (context) => SettingsPage(),
        '/news': (context) => NewsPage(),
        '/article': (context) => ArticlePage(),
        '/account': (context) => AccountPage(),
        '/account/email': (context) => EmailChangePage()
			}
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavBarIndex = 0;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
				centerTitle: true,
        backgroundColor: Color.fromARGB(255, 26, 26, 46),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(255, 26, 26, 46),
        child: Column(
					crossAxisAlignment:  CrossAxisAlignment.center,
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
            // Баланс
						Container(
							width: double.infinity,
							height:  MediaQuery.of(context).size.height*0.1,
              padding: const EdgeInsets.symmetric(horizontal: 20),
							child: Column(
							  children: [
                  const Divider(
                    color: Color.fromARGB(255, 46, 46, 66),
                    thickness: 2,
                  ),
							    Row(
							    	mainAxisAlignment: MainAxisAlignment.spaceAround,
							    	crossAxisAlignment: CrossAxisAlignment.center,
							    	children: const [
							    		Text(
                        "Баланс:",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
							    		Text(
                        "нищий",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
							    	],
							    ),
                  const Divider(
                    color: Color.fromARGB(255, 46, 46, 66),
                    thickness: 2,
                  ),
							  ],
							)
						),
            // Диаграмма
						Container(
							width: double.infinity,
							height: MediaQuery.of(context).size.height*0.35,
              child: Swiper(
                itemBuilder:(BuildContext context, int index){
                  return Stack(
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        colorList: colorList,
                        chartType: ChartType.ring,
                        chartRadius: 170,
                        legendOptions: LegendOptions(
                          showLegends: false
                        ),
                      ),
                      Center(
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
                control: SwiperControl(
                  color: Color.fromARGB(255, 141, 147, 171),
                  disableColor: Colors.transparent,
                  padding: EdgeInsets.all(10),
                )
              )
						),
						// Тип бюджета
            Container(
							width: double.infinity,
							height:  MediaQuery.of(context).size.height*0.05,
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceAround,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: const [
									Text(
                    "Тип бюджета:",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
									Text(
                    "дефицитный",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
								],
							)
						),
            // Расходы/доходы
						Container(
							width: double.infinity,
							height: MediaQuery.of(context).size.height*0.3,
							child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
							  children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: const Divider(
                      color: Color.fromARGB(255, 46, 46, 66),
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ),
							    Row(
							    	mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							    	crossAxisAlignment: CrossAxisAlignment.center,
							    	children: [
							    		GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/income');
                        },
                        child: Container(
                          width: 150,
                          height:  MediaQuery.of(context).size.height*0.15,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 34, 34, 54),
                            borderRadius: BorderRadius.circular(18)
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 138, 164, 255),
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(18))
                                ),
                              ),
                              Container(
                                width: 140,
                                height: double.infinity,
                                padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Доходы",
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color.fromARGB(255, 141, 147, 171)
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "5 операций",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "1000 рублей",
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
							    		GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/expense');
                        },
                        child: Container(
                          width: 150,
                          height:  MediaQuery.of(context).size.height*0.15,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 34, 34, 54),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 50, 76, 167),
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(18))
                                ),
                              ),
                              Container(
                                width: 140,
                                height: double.infinity,
                                padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Расходы",
                                          style: TextStyle(
                                          color: Colors.white
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color.fromARGB(255, 141, 147, 171)
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "6 операций",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                        children: const[
                                          Text(
                                            "1200 рублей",
                                            style: TextStyle(
                                              color: Colors.white
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
							    	],
							    ),
							  ],
							)
						)
					]
				)
      ),
			bottomNavigationBar: const NavBar()
      
    );
  }
}
