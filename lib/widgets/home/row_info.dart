import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  final List<String> item1;
  final List<String> item2;
  final List<String> item3;

  // ignore: use_key_in_widget_constructors
  const RowInfo(
    this.item1,
    this.item2,
    this.item3,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: IntrinsicHeight(
          child: Row(
            children: [
              _buildItem(item1, const Color.fromARGB(255, 227, 117, 1),
                  const Color.fromARGB(255, 237, 168, 1)),
              Container(
                width: 1,
                decoration: const BoxDecoration(color: Colors.white),
              ),
              _buildItem(item2, const Color.fromARGB(255, 62, 32, 149),
                  const Color.fromARGB(255, 166, 86, 191)),
              Container(
                width: 1,
                decoration: const BoxDecoration(color: Colors.white),
              ),
              _buildItem(item3, const Color.fromARGB(255, 236, 81, 68),
                  const Color.fromARGB(255, 239, 125, 79)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(
  List<String> item,
  Color color1,
  Color color2,
) {
  return Flexible(
    flex: 1,
    fit: FlexFit.tight,
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [color1, color2],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      )),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item[0],
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            item[1],
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
