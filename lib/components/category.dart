import 'package:flutter/material.dart';


class Category extends StatelessWidget {
  double? width;
  double? height;
  double padding;
  double borderRadius;
  Color color;
  Color? sideColor;

  Category({
    Key? key,
    this.width,
    this.height,
    this.padding = 20,
    this.borderRadius = 18,
    this.color = const Color.fromARGB(255, 34, 34, 54),
    this.sideColor
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Flexible(
                  flex: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Зарплата",
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                      Text(
                        "10 операций",
                        softWrap: false,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ),
                const Spacer(flex: 40),
                Flexible(
                  flex: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "500 RUB",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      Icon(
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
    );
  }
}