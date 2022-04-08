import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'components/navbar.dart';
import 'components/converter.dart';
import 'network/exchange_rates.dart';


class ExchangePage extends StatefulWidget {
  const ExchangePage({ Key? key }) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final List<String> currencies = ExchangeRates.currencies.keys.toList();
  final String baseCurrency = "RUB";

  Future<List<Map<String, dynamic>>> getExchangeRates(String base)async{
    List<String> codes = ExchangeRates.currencies.keys.toList();
    List<String> titles = ExchangeRates.currencies.values.toList();
    Map<String, num> exchangeRates = await ExchangeRates.getRates(base);
    List<num> rates = codes.map((String code){
      return exchangeRates[code]?? -1;
    }).toList();
    return List.generate(codes.length, (index) => {
      'code': codes[index],
      'title': titles[index],
      'buy': rates[index],
      'sell': rates[index]
    });
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
            Converter(),
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
              child: FutureBuilder(
                future: getExchangeRates(baseCurrency),
                builder: (BuildContext context, snapshot){
                  if (snapshot.connectionState == ConnectionState.done){
                    List<Map<String, dynamic>> rates = snapshot.data as List<Map<String, dynamic>>;
                    return ListView.separated(
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                rates[index]["code"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              const SizedBox(width: 114),
                              Text(
                                rates[index]["buy"].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              const Spacer(),
                              Text(
                                rates[index]["sell"].toString(),
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
                                rates[index]["title"],
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
                  itemCount: rates.length
                );
                  }
                  else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: const NavBar(initialIndex: 1,),
    );
  }
}