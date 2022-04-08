import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../network/exchange_rates.dart';

class Converter extends StatefulWidget {
  const Converter({ Key? key }) : super(key: key);

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final List<String> currencies = ExchangeRates.currencies.keys.toList();
  late List<String> selectedCurrencies = ["USD", "RUB"];
  final _formKey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController(
    text: "1"
  );
  TextEditingController resultController = TextEditingController();

  double conversionRate = 1;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: (){
        //save form state
        _formKey.currentState?.save();
      },
      child: Container(
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
                  keyboardType: const TextInputType.numberWithOptions(decimal:true),
                  onChanged: (String? value) {
                    amountController.text = value!;
                    updateResultField();
                  },
                ),
                SizedBox(
                  width: 125,
                  child: DropdownButtonFormField2<String>(
                    value: selectedCurrencies[0],
                    onChanged: (String? newValue){
                      setState(
                        (){selectedCurrencies[0] = newValue!;}
                      );
                      updateResultField();
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
                  enabled: false,
                  controller: resultController,
                  decoration: const InputDecoration(
                    constraints: BoxConstraints.tightFor(
                      width: 180,
                      height: 40
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromARGB(255, 46, 46, 66),
                      ),
                    ),
                    fillColor: Color.fromARGB(255, 34, 34, 54),
                    filled: true,
                    hintText: "Результат",
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
                  keyboardType: const TextInputType.numberWithOptions(decimal:true),
                  
                ),
                SizedBox(
                  width: 125,
                  child: DropdownButtonFormField2<String>(
                    value: selectedCurrencies[1],
                    onChanged: (String? newValue){
                      setState(
                        (){selectedCurrencies[1] = newValue!;}
                      );
                      updateResultField();
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
    );
  }
  void setConversionRate()async{
    //set conversion rate to the result of ExchangeRates.getConversionRate of selected currencies
    double rate = await ExchangeRates.getConversionRate(
          selectedCurrencies[0],
          selectedCurrencies[1]
        ) as double;
    setState(
      ()async {
        conversionRate = rate;
      }
    );
  }

  void updateResultField()async{
     //set the result field to amount * conversion rate
     double rate = await ExchangeRates.getConversionRate(
          selectedCurrencies[0],
          selectedCurrencies[1]
     )as double;
    setState(
      (){
        conversionRate = rate;
        resultController.text = (double.parse(amountController.text) * conversionRate).toStringAsFixed(2);
      }
    );
  }
    
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
}