import 'package:flutter/material.dart';
import 'package:sugar_duck/database_utility/operation_manager.dart';


class Category extends StatelessWidget {
  double? width;
  double? height;
  double padding;
  double borderRadius;
  Color color;
  Color? sideColor;
  String title;
  int amount;
  double sum;

  Category({
    Key? key,
    this.width,
    this.height,
    this.padding = 20,
    this.borderRadius = 18,
    this.color = const Color.fromARGB(255, 34, 34, 54),
    this.sideColor,
    required this.title,
    required this.amount,
    required this.sum
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context, '/category_' + (OperationManager.nameInDataBase[title] ?? "undefined"));},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18)
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height: double.infinity,
              decoration: BoxDecoration(
                color: sideColor,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(borderRadius))
              ),
            ),
            Container(
              width: width! - 10,
              height: double.infinity,
              padding: EdgeInsets.fromLTRB(padding-10, padding/2, padding, padding/2),
              child: Row(
                children: [
                  Expanded(
                    flex: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          softWrap: false,
                          style: const TextStyle(
                            color: Colors.white
                          )
                        ),
                        Text(
                          "$amount операций",
                          softWrap: false,
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    )
                  ),
                  const Spacer(flex: 30),
                  Expanded(
                    flex: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$sum RUB",
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Color.fromARGB(255, 141, 147, 171),
                        ),
                      ],
                    ),
                  ),
                  
                ]
              ),
            ),
            
          ],
        )
      ),
    );
  }
}