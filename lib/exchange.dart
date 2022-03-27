import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'components/navbar.dart';


class ExchangePage extends StatefulWidget {
  const ExchangePage({ Key? key }) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  late List<String> currencies = [
    "RUB",
    "USD",
    "EUR"
  ];
  late List<String> selectedCurrencies = ["USD", "RUB"];
  List<Map<String, dynamic>> exchangeRates = [
    {
      "code": "USD",
      "title": "Доллар США",
      "buy": 111.75,
      "sell": 90.83
    },
    {
      "code": "EUR",
      "title": "Евро",
      "buy": 122.17,
      "sell": 99.29
    },
    {
      "code": "GBP",
      "title": "Фунт стерлингов",
      "buy": 147.52,
      "sell": 115.06
    }
  ];


  List<DropdownMenuItem<String>> getCurrencyItems(){
    List<String> titles = currencies;
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
          "Курсы валют",
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 26, 26, 46),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 26, 26, 46),
        child: Column(
          children: [
            const Divider(
              color: Color.fromARGB(255, 46, 46, 66),
              indent: 20,
              endIndent: 20,
              thickness: 2,
              height: 2
            ),
            //Конвертер
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Перевод валюты",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          constraints: BoxConstraints.tightFor(
                            width: 180,
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
                          hintText: "Введите сумму",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(128, 255, 255, 255),
                            fontWeight: FontWeight.w400 
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 46, 46, 66),
                            )
                          )
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 125,
                        child: DropdownButtonFormField2<String>(
                          onChanged: (String? newValue){
                            setState(
                              (){selectedCurrencies[0] = newValue!;}
                            );
                          },
                          hint: const Text(
                            "Выберите валюту",
                            style: TextStyle(
                              color: Color.fromARGB(128, 255, 255, 255),
                              fontSize: 10
                            )
                          ),
                          items: getCurrencyItems(),
                          decoration: const InputDecoration(
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
                          buttonWidth: 125,
                          buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                          itemHeight: 20,
                          dropdownDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                            color: Color.fromARGB(255, 46, 46, 66)
                          ),
                          dropdownWidth: 125,
                          offset: const Offset(0, 10),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          constraints: BoxConstraints.tightFor(
                            width: 180,
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
                          hintText: "Введите сумму",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(128, 255, 255, 255),
                            fontWeight: FontWeight.w400 
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 46, 46, 66),
                            )
                          )
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 125,
                        child: DropdownButtonFormField2<String>(
                          onChanged: (String? newValue){
                            setState(
                              (){selectedCurrencies[1] = newValue!;}
                            );
                          },
                          hint: const Text(
                            "Выберите валюту",
                            style: TextStyle(
                              color: Color.fromARGB(128, 255, 255, 255),
                              fontSize: 10
                            )
                          ),
                          items: getCurrencyItems(),
                          decoration: const InputDecoration(
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
                          buttonWidth: 125,
                          buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                          itemHeight: 20,
                          dropdownDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                            color: Color.fromARGB(255, 46, 46, 66)
                          ),
                          dropdownWidth: 125,
                          offset: const Offset(0, 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 46, 46, 66),
              thickness: 2,
              height: 2
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                children: const [
                  Text(
                    "Валюта",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(flex: 2),
                  Text(
                    "Купля",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "Продажа",
                    style: TextStyle(color: Colors.white),   
                  )
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 46, 46, 66),
              thickness: 2,
              height: 2
            ),
            // Список валют
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              exchangeRates[index]["code"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(width: 114),
                            Text(
                              exchangeRates[index]["buy"].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            const Spacer(),
                            Text(
                              exchangeRates[index]["sell"].toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              exchangeRates[index]["title"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400
                              )
                            )
                          ],
                        ),
                        const Spacer(flex: 2)
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index){
                  return const Divider(
                    color: Color.fromARGB(255, 46, 46, 66),
                    thickness: 2,
                    height: 2,
                    indent: 20,
                    endIndent: 20
                  );
                }, 
                itemCount: exchangeRates.length
              ),
            )
          ]
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}